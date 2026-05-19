/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_URL = '/ecommerce_WEB/api/productos';

document.addEventListener('DOMContentLoaded', () => {
    const formulario = document.getElementById('formularioCrear');

    // Verificamos que el formulario exista en la pantalla
    if (formulario) {
        formulario.addEventListener('submit', async (evento) => {
            evento.preventDefault(); 

            // Recolectamos y transformamos los valores de las cajas de texto
            const nuevoProducto = {
                nombre: document.getElementById('nombre').value,
                descripcion: document.getElementById('descripcion').value,
                precio: parseFloat(document.getElementById('precio').value),
                existencia: parseInt(document.getElementById('cantidad').value),
                categoriaId: parseInt(document.getElementById('categoria').value)
            };

            try {
                // Enviamos los datos a Java
                const respuesta = await fetch(API_URL, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json' 
                    },
                    body: JSON.stringify(nuevoProducto) 
                });

                if (respuesta.status === 201) { 
                    alert("Producto agregado al catálogo correctamente.");
                    // Redirigimos al catálogo para ver el nuevo registro
                    window.location.href = 'gestionarCatalogoProductos.jsp';
                } else {
                    console.error("Error del servidor:", respuesta.status);
                    alert("Error al guardar el producto. Verifica los datos.");
                }
            } catch (error) {
                console.error("Fallo crítico en la red:", error);
                alert("No se pudo conectar con el servidor.");
            }
        });
    }
});

