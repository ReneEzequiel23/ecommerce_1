/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_URL = '/ecommerce_WEB/api/productos';

const parametrosURL = new URLSearchParams(window.location.search);
const idProducto = parametrosURL.get('id');

document.addEventListener('DOMContentLoaded', async () => {
    
    // Si no hay ID en la URL, regresamos al catálogo para evitar errores
    if (!idProducto) {
        alert("No se especificó qué producto editar.");
        window.location.href = 'gestionarCatalogoProductos.jsp';
        return;
    }

    try {
        const respuesta = await fetch(`${API_URL}/${idProducto}`);
        if (respuesta.ok) {
            const producto = await respuesta.json();
            
            // Llenamos las cajas de texto con los datos de Java
            document.getElementById('nombre').value = producto.nombre;
            document.getElementById('descripcion').value = producto.descripcion;
            document.getElementById('precio').value = producto.precio;
            document.getElementById('cantidad').value = producto.existencia;
            document.getElementById('categoria').value = producto.categoriaId;
        } else {
            alert("No se encontró el producto en la base de datos.");
            window.location.href = 'gestionarCatalogoProductos.jsp';
        }
    } catch (error) {
        console.error("Error cargando datos:", error);
    }

    const formulario = document.getElementById('formularioEditar');
    formulario.addEventListener('submit', async (evento) => {
        evento.preventDefault(); 

        const productoActualizado = {
            id: parseInt(idProducto), // Enviamos el ID para que MySQL sepa a quién actualizar
            nombre: document.getElementById('nombre').value,
            descripcion: document.getElementById('descripcion').value,
            precio: parseFloat(document.getElementById('precio').value),
            existencia: parseInt(document.getElementById('cantidad').value),
            categoriaId: parseInt(document.getElementById('categoria').value)
        };

        try {
            // Mandamos los datos usando el verbo PUT
            const respuestaActualizacion = await fetch(`${API_URL}/${idProducto}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(productoActualizado)
            });

            if (respuestaActualizacion.ok) {
                alert("Libro actualizado correctamente.");
                window.location.href = 'gestionarCatalogoProductos.jsp';
            } else {
                alert("Hubo un problema al actualizar el registro.");
            }
        } catch (error) {
            console.error("Error al guardar:", error);
        }
    });
});
