/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_PRODUCTOS = '/ecommerce_WEB/api/productos';

document.addEventListener('DOMContentLoaded', () => {
    // Si estamos en la pantalla del carrito, cargamos los datos
    if (document.getElementById('cuerpoCarrito')) {
        renderizarCarrito();
    }
});


function agregarAlCarrito(idProducto) {
    // Leemos el carrito actual o creamos uno nuevo
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];
    
    // Buscamos si el libro ya está agregado
    let item = carrito.find(p => p.id === idProducto);
    
    if (item) {
        item.cantidad += 1; // Si ya está, sumamos 1
    } else {
        carrito.push({ id: idProducto, cantidad: 1 }); // Si es nuevo, lo agregamos
    }
    
    // Guardamos los cambios en el navegador
    localStorage.setItem('carritoApp', JSON.stringify(carrito));
    alert("Libro agregado al carrito exitosamente.");
}

async function cargarVistaCarrito() {
    const cuerpoCarrito = document.getElementById('cuerpoCarrito');
    const carrito = JSON.parse(localStorage.getItem('carrito')) || [];

    if (carrito.length === 0) {
        cuerpoCarrito.innerHTML = '<tr><td colspan="4">El carrito está vacío</td></tr>';
        actualizarTotal(0);
        return;
    }

    cuerpoCarrito.innerHTML = '';
    let costoTotal = 0;

    // Iteramos de forma asíncrona sobre cada elemento guardado en el navegador
    for (let item of carrito) {
        try {
            // Consultamos los datos frescos del libro a tu API
            const respuesta = await fetch(`/ecommerce_WEB/api/productos/${item.id}`);
            if (respuesta.ok) {
                const producto = await respuesta.json();
                const subtotal = producto.precio * item.cantidad;
                costoTotal += subtotal;

                // Manipulamos el DOM para inyectar la fila
                const fila = document.createElement('tr');
                fila.innerHTML = `
                    <td>${producto.nombre}</td>
                    <td>$${producto.precio.toFixed(2)}</td>
                    <td>
                        <input type="number" value="${item.cantidad}" min="1" 
                               onchange="actualizarCantidad(${item.id}, this.value)">
                    </td>
                    <td>
                        <button type="button" class="btn-eliminar" onclick="eliminarDelCarrito(${item.id})">
                            Eliminar
                        </button>
                    </td>
                `;
                cuerpoCarrito.appendChild(fila);
            }
        } catch (error) {
            console.error("Error al recuperar item del carrito:", error);
        }
    }

    actualizarTotal(costoTotal);
}

async function renderizarCarrito() {
    const cuerpoCarrito = document.getElementById('cuerpoCarrito');
    const inputTotal = document.getElementById('costoTotal');
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];

    if (carrito.length === 0) {
        cuerpoCarrito.innerHTML = '<tr><td colspan="4" style="text-align:center;">Tu carrito está vacío.</td></tr>';
        inputTotal.value = "$0.00";
        return;
    }

    cuerpoCarrito.innerHTML = ''; // Limpiamos cargando
    let granTotal = 0;

    // Iteramos asíncronamente para traer los datos frescos de la BD
    for (let item of carrito) {
        try {
            const respuesta = await fetch(`${API_PRODUCTOS}/${item.id}`);
            if (respuesta.ok) {
                const libro = await respuesta.json();
                const subtotal = libro.precio * item.cantidad;
                granTotal += subtotal;

                const fila = document.createElement('tr');
                fila.innerHTML = `
                    <td>${libro.nombre}</td>
                    <td>$${libro.precio.toFixed(2)}</td>
                    <td>
                        <input type="number" value="${item.cantidad}" min="1" 
                               onchange="cambiarCantidad(${item.id}, this.value)" 
                               style="width: 60px; text-align: center;">
                    </td>
                    <td>
                        <button type="button" class="btn-eliminar" onclick="eliminarItem(${item.id})">Eliminar</button>
                    </td>
                `;
                cuerpoCarrito.appendChild(fila);
            }
        } catch (error) {
            console.error("Error al cargar producto del carrito:", error);
        }
    }
    
    inputTotal.value = `$${granTotal.toFixed(2)}`;
}

// Función para el punto 3.2: Actualizar cantidades
function cambiarCantidad(idProducto, nuevaCantidad) {
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];
    let item = carrito.find(p => p.id === idProducto);
    
    if (item) {
        item.cantidad = parseInt(nuevaCantidad);
        localStorage.setItem('carritoApp', JSON.stringify(carrito));
        renderizarCarrito(); // Redibujamos para recalcular el total
    }
}

// Función para el punto 3.1: Eliminar del carrito
function eliminarItem(idProducto) {
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];
    // Filtramos dejando todos menos el que queremos borrar
    carrito = carrito.filter(p => p.id !== idProducto);
    
    localStorage.setItem('carritoApp', JSON.stringify(carrito));
    renderizarCarrito(); // Redibujamos la tabla
}