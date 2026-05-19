/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_URL = '/ecommerce_WEB/api/productos';

// 1. Verificamos si el archivo JS realmente se está ejecutando
console.log("--- INICIANDO SCRIPT DE CATÁLOGO ---");

document.addEventListener('DOMContentLoaded', () => {
    console.log("El DOM cargó completamente. Ejecutando cargarProductos()...");
    cargarProductos();
});

async function cargarProductos() {
    const cuerpoTabla = document.getElementById('cuerpoTabla');
    
    // 2. Revisamos si JavaScript encuentra tu tabla en el JSP
    console.log("Elemento cuerpoTabla encontrado:", cuerpoTabla);
    if (!cuerpoTabla) {
        console.error("¡ALERTA ROJA! No se encontró el id='cuerpoTabla' en tu JSP. Revisa el HTML.");
        return; // Detiene la ejecución para que no colapse
    }

    try {
        // 3. Revisamos la petición al servidor
        console.log("Haciendo petición Fetch a la URL:", API_URL);
        const respuesta = await fetch(API_URL);
        console.log("Estado de la respuesta HTTP:", respuesta.status);

        // 4. Leemos el texto puro antes de intentar convertirlo a JSON
        // Esto es clave por si Java está enviando una página de error en lugar de datos
        const textoPuro = await respuesta.text();
        console.log("Texto puro recibido del servidor:", textoPuro);

        if (!respuesta.ok) {
            throw new Error("El servidor respondió con error " + respuesta.status);
        }

        // 5. Intentamos convertir a JSON
        const productos = JSON.parse(textoPuro);
        console.log("Productos convertidos a JavaScript (Array):", productos);

        cuerpoTabla.innerHTML = '';

        if (productos.length === 0) {
            console.warn("La consulta fue exitosa, pero el arreglo de productos está vacío []");
            cuerpoTabla.innerHTML = '<tr><td colspan="5" style="text-align:center;">No hay productos registrados en MySQL.</td></tr>';
            return;
        }

        // 6. Dibujamos la tabla
        productos.forEach(producto => {
            const fila = document.createElement('tr');
            fila.innerHTML = `
                <td>${producto.id}</td>
                <td>${producto.nombre}</td>
                <td>$${producto.precio.toFixed(2)}</td>
                <td>${producto.existencia}</td>
                <td class="celda-acciones">
                <button class="btn-estado" onclick="editarProducto(${producto.id})">Editar</button>
                <button class="btn-eliminar" style="background-color: #d9534f; color: white;" onclick="eliminarProducto(${producto.id})">Eliminar</button></td>
            `;
            cuerpoTabla.appendChild(fila);
        });
        console.log("--- TABLA DIBUJADA CON ÉXITO ---");

    } catch (error) {
        console.error("Fallo crítico en la ejecución:", error);
    }
}

/**
 * Función para redireccionar a la pantalla de edición guardando el ID de interés
 */
function redireccionarEditar(id) {
    // Una opción muy elegante con REST/BOM es mandar el id por la URL de la página
    window.location.href = `editarProducto.html?id=${id}`;
}

/**
 * Función asíncrona para eliminar un producto mediante el método HTTP DELETE
 */
async function eliminarProducto(id) {
    // 1. Mostrar una alerta de confirmación nativa del navegador
    const confirmar = confirm(`¿Estás seguro de que deseas eliminar el producto con ID ${id} del catálogo?`);
    
    // Si el administrador presiona "Cancelar", detenemos la función
    if (!confirmar) {
        return; 
    }

    try {
        // 2. Hacemos la petición Fetch especificando el método DELETE
        console.log(`Intentando eliminar el producto ${id}...`);
        const respuesta = await fetch(`${API_URL}/${id}`, {
            method: 'DELETE'
        });

        // 3. Verificamos la respuesta del servidor
        if (respuesta.ok) {
            console.log("Producto eliminado con éxito.");
            
            // 4. Volvemos a llamar a la función que pinta la tabla
            // Esto hará que el registro desaparezca de la vista al instante sin recargar la página entera
            cargarProductos();
            
        } else {
            console.error("El servidor respondió con error:", respuesta.status);
            alert("Hubo un problema al intentar eliminar el producto del inventario.");
        }

    } catch (error) {
        console.error("Fallo crítico en la red:", error);
        alert("No se pudo conectar con el servidor para eliminar el producto.");
    }
}

function editarProducto(id) {
    window.location.href = `editarProducto.jsp?id=${id}`;
}
