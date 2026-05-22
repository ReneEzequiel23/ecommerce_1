/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_PRODUCTOS = '/ecommerce_WEB/api/productos';

let catalogoOriginal = [];

document.addEventListener('DOMContentLoaded', () => {
    cargarCatalogo();
    configurarFiltros();
});

/**
 * Función asíncrona para traer los libros de la base de datos
 */
async function cargarCatalogo() {
    try {
        const respuesta = await fetch(API_PRODUCTOS);

        if (respuesta.ok) {
            catalogoOriginal = await respuesta.json();
            dibujarTabla(catalogoOriginal);
        } else {
            document.getElementById('cuerpoCatalogoCliente').innerHTML =
                    '<tr><td colspan="4" style="text-align:center;">No hay libros disponibles en este momento.</td></tr>';
        }
    } catch (error) {
        console.error("Error al cargar el catálogo:", error);
    }
}

/**
 * Función para inyectar el HTML de los libros en la tabla
 */
function dibujarTabla(productos) {
    const cuerpoTabla = document.getElementById('cuerpoCatalogoCliente');
    cuerpoTabla.innerHTML = ''; // Limpiamos la tabla antes de dibujar

    productos.forEach(producto => {
        const fila = document.createElement('tr');

        fila.innerHTML = `
            <td>${producto.nombre}</td>
            <td>$${producto.precio.toFixed(2)}</td>
            
            <td style="text-align: center;">
                <button type="button" class="btn-detalles" 
                        onclick="verDetalles(${producto.id})">
                    Detalles
                </button>
            </td>
            
            <td class="celda-acciones">
                <button type="button" class="btn-agregar" 
                        onclick="agregarAlCarrito(${producto.id}, '${producto.nombre}')">
                    Agregar Carrito
                </button>
        
                <button type="button" class="btn-resena" 
                        onclick="dejarResena(${producto.id})">
                    Dejar Reseña
                </button>
            </td>
        `;
        cuerpoTabla.appendChild(fila);
    });
}

/**
 * Función para guardar el libro en el LocalStorage
 */
function agregarAlCarrito(idProducto, nombreLibro) {
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];

    // Buscamos si el libro ya está agregado
    let item = carrito.find(p => p.id === idProducto);

    if (item) {
        item.cantidad += 1;
    } else {
        carrito.push({id: idProducto, cantidad: 1});
    }

    localStorage.setItem('carritoApp', JSON.stringify(carrito));
    alert(`"${nombreLibro}" se agregó a tu carrito.`);
    
//    window.location.href = 'carritoCompras.jsp';
}

// Funciones pendientes de implementar
function verDetalles(id) {
    window.location.href = `detallesDelProducto.jsp?id=${id}`;
}

function dejarResena(id) {
    window.location.href = `crearResena.jsp?productoId=${id}`;
}

function configurarFiltros() {
    const formulario = document.getElementById('formFiltros');
    
    formulario.addEventListener('submit', (evento) => {
        // Evitamos que la página parpadee y recargue
        evento.preventDefault();
        
        // 1. Obtenemos lo que el usuario escribió
        const textoBusqueda = document.getElementById('f-nombre').value.toLowerCase();
        const usarPrecio = document.getElementById('check-precio').checked;
        const precioLimite = parseFloat(document.getElementById('f-precio').value);
        const rango = document.querySelector('input[name="rango"]:checked').value; // 'mayor' o 'menor'
        
        // 2. Empezamos con la lista completa
        let listaFiltrada = catalogoOriginal;
        
        // 3. Filtro por nombre (Si escribió algo)
        if (textoBusqueda !== "") {
            listaFiltrada = listaFiltrada.filter(libro => 
                libro.nombre.toLowerCase().includes(textoBusqueda)
            );
        }
        
        // 4. Filtro por precio (Solo si activó la palomita y escribió un número válido)
        if (usarPrecio && !isNaN(precioLimite)) {
            if (rango === 'mayor') {
                // Traer los que cuesten IGUAL O MÁS que el límite
                listaFiltrada = listaFiltrada.filter(libro => libro.precio >= precioLimite);
            } else if (rango === 'menor') {
                // Traer los que cuesten IGUAL O MENOS que el límite
                listaFiltrada = listaFiltrada.filter(libro => libro.precio <= precioLimite);
            }
        }
        
        // 5. Borramos la tabla actual y la volvemos a dibujar solo con los que pasaron el filtro
        dibujarTabla(listaFiltrada);
    });
}
