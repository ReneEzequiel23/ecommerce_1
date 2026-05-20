/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const API_PRODUCTOS = '/ecommerce_WEB/api/productos';

document.addEventListener('DOMContentLoaded', () => {
    cargarResumenPedido();
    configurarBotonPago();
});

async function cargarResumenPedido() {
    const cuerpoResumen = document.getElementById('cuerpoResumen');
    const inputCostoFinal = document.getElementById('costoFinal');
    let carrito = JSON.parse(localStorage.getItem('carritoApp')) || [];

    // Si el carrito está vacío por alguna razón, lo regresamos a la tienda
    if (carrito.length === 0) {
        alert("Tu carrito está vacío. Serás redirigido al catálogo.");
        window.location.href = 'catalogoProductos.jsp';
        return;
    }

    cuerpoResumen.innerHTML = ''; 
    let granTotal = 0;

    // Iteramos para traer los datos reales de Java
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
                    <td style="text-align: center;">${item.cantidad}</td>
                    <td><strong>$${subtotal.toFixed(2)}</strong></td>
                `;
                cuerpoResumen.appendChild(fila);
            }
        } catch (error) {
            console.error("Error al cargar producto para el resumen:", error);
        }
    }
    
    inputCostoFinal.value = `$${granTotal.toFixed(2)}`;
}

function configurarBotonPago() {
    const btnConfirmar = document.getElementById('btnConfirmarPedido');
    
    btnConfirmar.addEventListener('click', async () => {
        // 1. Verificamos que haya seleccionado un método de pago
        const metodoPago = document.querySelector('input[name="metodo_pago"]:checked');
        
        if (!metodoPago) {
            alert("Por favor, selecciona un método de pago antes de continuar.");
            return;
        }

        // 2. Aquí prepararemos el JSON con el pedido para enviarlo a Java (Punto 4.2)
        const carrito = JSON.parse(localStorage.getItem('carritoApp'));
        
        const nuevoPedido = {
            metodoPago: metodoPago.value,
            detalles: carrito // Mandamos los IDs y las cantidades
        };

        console.log("JSON listo para enviar a Java:", nuevoPedido);
        
        // Simulación temporal de éxito
        alert("Procesando pago... ¡Pedido confirmado!");
        localStorage.removeItem('carritoApp'); // Vaciamos el carrito tras comprar
        window.location.href = 'compraRealizada.jsp'; // O la pantalla que decidan
    });
}