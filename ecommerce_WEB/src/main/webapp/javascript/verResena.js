/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', () => {
    const parametros = new URLSearchParams(window.location.search);
    const idResena = parametros.get('id');

    if (idResena) {
        cargarDetallesResena(idResena);
    } else {
        alert("No se proporcionó un ID de reseña válido.");
    }
});

async function cargarDetallesResena(id) {
    try {
        const respuesta = await fetch(`/ecommerce_WEB/api/resenas/${id}/detalles`);
        
        if (respuesta.ok) {
            const datos = await respuesta.json();
            
            
            document.getElementById('nombre').value = datos.nombreUsuario;
            document.getElementById('producto').value = datos.nombreProducto;
            document.getElementById('calificacion').value = datos.calificacion;
            document.getElementById('comentario').value = datos.comentario;
        } else {
            console.error("Error al cargar datos:", respuesta.status);
            alert("No se pudo encontrar la reseña.");
        }
    } catch (error) {
        console.error("Fallo la conexión:", error);
    }
}
