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

        // 2. Preparamos el JSON con el pedido para enviarlo a Java
        const carrito = JSON.parse(localStorage.getItem('carritoApp'));

        const nuevoPedido = {
            metodoPago: metodoPago.value,
            detalles: carrito // Mandamos los IDs y las cantidades
        };

        console.log("Enviando petición a Java...", nuevoPedido);

        // 3. Desactivamos el botón temporalmente para evitar que el usuario haga doble clic y cobre dos veces
        btnConfirmar.disabled = true;
        btnConfirmar.innerText = "Procesando pago...";

        try {
            // 4. Hacemos la petición POST a nuestro nuevo recurso REST
            const respuesta = await fetch('/ecommerce_WEB/api/pedidos', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(nuevoPedido)
            });

            // 5. Evaluamos la respuesta del servidor
            if (respuesta.status === 201) {
                // El DAO hizo el commit con éxito en las tablas Pedido, Detalle_Pedido y Pago
                alert("¡Pago procesado con éxito! Tu pedido ha sido confirmado.");

                // Vaciamos el carrito porque la compra ya finalizó
                localStorage.removeItem('carritoApp');

                // Redirigimos a la pantalla de éxito o al catálogo
                window.location.href = 'catalogoProductos.jsp';
            } else {
                // Java devolvió un error (ej. falta de stock, fallo en SQL)
                const errorInfo = await respuesta.json();
                alert(`Hubo un problema con tu pago: ${errorInfo.mensaje}`);

                // Reactivamos el botón por si quiere intentar de nuevo
                btnConfirmar.disabled = false;
                btnConfirmar.innerText = "Confirmar y Pagar";
            }

        } catch (error) {
            console.error("Error crítico de red:", error);
            alert("No se pudo conectar con el servidor para procesar el pago.");

            btnConfirmar.disabled = false;
            btnConfirmar.innerText = "Confirmar y Pagar";
        }
    });
}