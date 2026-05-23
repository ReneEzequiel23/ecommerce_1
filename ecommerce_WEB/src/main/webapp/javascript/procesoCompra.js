const API_PRODUCTOS = '/ecommerce_WEB/api/productos';
document.addEventListener('DOMContentLoaded', () => {
    cargarResumenPedido();
    cargarDirecciones();
    configurarBotonPago();
});

async function cargarResumenPedido() {
    const cuerpoResumen = document.getElementById('cuerpoResumen');
    const inputCostoFinal = document.getElementById('costoFinal');

    let carrito = JSON.parse(localStorage.getItem('carritoApp'));

    if (!carrito) {
        carrito = [];
    }

    if (carrito.length === 0) {
        alert("Tu carrito está vacío. Serás redirigido al catálogo para que agregues libros.");
        window.location.href = 'catalogoProductos.jsp';
        return;
    }

    cuerpoResumen.innerHTML = '';
    let granTotal = 0;

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
            console.error("Error al cargar producto:", error);
        }
    }

    inputCostoFinal.value = `$${granTotal.toFixed(2)}`;
}

async function cargarDirecciones() {
    const selectDireccion = document.getElementById('direccionSelect');
    if (!selectDireccion)
        return;

    selectDireccion.innerHTML = '<option disabled selected>Cargando direcciones...</option>';

    try {
        if (ID_USUARIO_ACTIVO === null) {
            selectDireccion.innerHTML = '<option disabled>Inicia sesión para ver tus direcciones</option>';
            return;
        }

        const respuesta = await fetch('/ecommerce_WEB/api/direcciones/usuario/' + ID_USUARIO_ACTIVO);

        if (respuesta.ok) {
            const direcciones = await respuesta.json();
            selectDireccion.innerHTML = '';

            if (direcciones.length === 0) {
                selectDireccion.innerHTML = '<option disabled>No tienes direcciones registradas</option>';
            } else {
                direcciones.forEach(dir => {
                    const opcion = document.createElement('option');
                    opcion.value = dir.id;
                    opcion.textContent = `${dir.calle}, ${dir.ciudad}, ${dir.estado}, CP: ${dir.codigo}`;
                    selectDireccion.appendChild(opcion);
                });
            }
        } else {
            console.error("El servidor respondió con error HTTP:", respuesta.status);
            selectDireccion.innerHTML = `<option disabled>Error HTTP ${respuesta.status}</option>`;
        }
    } catch (error) {
        console.error("Error al cargar direcciones:", error);
        selectDireccion.innerHTML = '<option disabled>Error de conexión</option>';
    }
}

function configurarBotonPago() {
    const btnConfirmar = document.getElementById('btnConfirmarPedido');
    if (!btnConfirmar)
        return;

    btnConfirmar.addEventListener('click', async () => {
        const metodoPago = document.querySelector('input[name="metodo_pago"]:checked');
        const direccionId = document.getElementById('direccionSelect').value;

        if (!metodoPago) {
            alert("Por favor, selecciona un método de pago.");
            return;
        }

        const carrito = JSON.parse(localStorage.getItem('carritoApp'));

        const nuevoPedido = {
            metodoPago: metodoPago.value,
            direccionId: parseInt(direccionId),
            detalles: carrito
        };

        btnConfirmar.disabled = true;
        btnConfirmar.innerText = "Procesando pago...";

        try {
            const respuesta = await fetch('/ecommerce_WEB/api/pedidos', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                credentials: 'same-origin',
                body: JSON.stringify(nuevoPedido)
            });

            if (respuesta.status === 201) {
                alert("¡Pago procesado con éxito! Tu pedido ha sido confirmado.");
                localStorage.removeItem('carritoApp');
                window.location.href = 'catalogoProductos.jsp';
            } else {
                const errorInfo = await respuesta.json();
                alert(`Hubo un problema: ${errorInfo.mensaje}`);
                btnConfirmar.disabled = false;
                btnConfirmar.innerText = "Confirmar y Pagar";
            }
        } catch (error) {
            console.error("Error de red:", error);
            alert("No se pudo conectar con el servidor.");
            btnConfirmar.disabled = false;
            btnConfirmar.innerText = "Confirmar y Pagar";
        }
    });
}