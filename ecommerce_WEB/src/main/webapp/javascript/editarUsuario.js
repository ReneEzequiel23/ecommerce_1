/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const API_URL = '/ecommerce_WEB/api/clientes';

const parametrosURL = new URLSearchParams(window.location.search);
const idUsuario = parametrosURL.get('id');

document.addEventListener('DOMContentLoaded', async () => {

    // Si no hay ID en la URL, regresamos al catálogo para evitar errores
    if (!idProducto) {
        alert("No se especificó qué cliente editar.");
        window.location.href = 'UsuarioServlet';
        return;
    }

    try {
        const respuesta = await fetch(`${API_URL}/${idUsuario}`);
        if (respuesta.ok) {
            const usuario = await respuesta.json();

            // Llenamos las cajas de texto con los datos de Java
            document.getElementById('rol').value = usuario.rol;
            document.getElementById('activo').value = usuario.activo;
        } else {
            alert("No se encontró el usuarios en la base de datos.");
            window.location.href = 'UsuarioServlet';
        }
    } catch (error) {
        console.error("Error cargando datos:", error);
    }

    const formulario = document.getElementById('formularioEditar');
    formulario.addEventListener('submit', async (evento) => {
        evento.preventDefault();

        const usuarioActualizado = {
            id: parseInt(idProducto), // Enviamos el ID para que MySQL sepa a quién actualizar
            rol: document.getElementById('rol').value,
            activo: document.getElementById('activo').value,
        };

        try {
            // Mandamos los datos usando el verbo PUT
            const respuestaActualizacion = await fetch(`${API_URL}/${idUsuario}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(usuarioActualizado)
            });

            if (respuestaActualizacion.ok) {
                alert("Usuario actualizado correctamente.");
                window.location.href = 'UsuarioServlet';
            } else {
                alert("Hubo un problema al actualizar el usuario.");
            }
        } catch (error) {
            console.error("Error al guardar:", error);
        }
    });
});


