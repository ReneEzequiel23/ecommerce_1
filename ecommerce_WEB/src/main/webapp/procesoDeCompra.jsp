<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Proceso de Compra</title>
        <link rel="stylesheet" href="css/procesoCompra.css" />
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <style>
            .contenido *,
            .caja-tabla *,
            .metodoP *,
            .segundo-cont * {
                color: #222222;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <header>
            <button id="toggleSidebar">☰ Menu</button>
            <div class="profile">
                <img src="Img/perfil.png" id="profilePic" alt="Perfil" />
                <div id="profileMenu" class="dropdown hidden">
                    <a href="inicioDeSesion.jsp">Iniciar Sesión</a>
                    <a href="PerfilUsuario.jsp">Perfil</a>
                    <a href="LogoutServlet">Cerrar Sesión</a>
                </div>
            </div>
        </header>

        <div id="sidebar" class="sidebar">
            <a href="PantallaAgregar.html">Inicio</a>
            <a href="catalogoProductos.jsp">Catálogo de Productos</a>
            <a href="carritoCompras.jsp">Carrito de Compras</a>
            <a href="gestionDePedidos.jsp">Gestion de Pedidos</a>
            <a href="administradorPantalla.jsp">Administrador</a>
        </div>
        <main>
            <h2>Proceso de compra</h2>
            <div class="containPP">

                <div id="containerPg" class="contenido">

                    <div class="caja-direccion" style="padding: 20px; border-radius: 8px; margin-bottom: 20px;">
                        <h2 style="color: white !important;">Dirección de Entrega</h2>
                        <select id="direccionSelect" style="width: 100%; padding: 10px; font-size: 16px;">
                            <option disabled selected>Cargando direcciones desde el servidor...</option>
                        </select>
                    </div>

                    <div class="primer-cont">
                        <div class="caja-tabla">
                            <table class="tabla-productos" >
                                <thead>
                                    <tr>
                                        <th>Nombre del Producto</th>
                                        <th>Precio</th>
                                        <th>Cantidad</th>
                                        <th>Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody id="cuerpoResumen">
                                </tbody>
                            </table>
                        </div>

                        <div class="metodoP">
                            <h2>Metodo de Pago</h2>
                            <form action="#" method="POST" class="formulario-pago">
                                <div class="radios">
                                    <input type="radio" id="tarjeta" name="metodo_pago" value="tarjeta" />
                                    <label for="tarjeta">Tarjeta de Credito/Debito</label>
                                </div>
                                <div class="radios">
                                    <input type="radio" id="oxxo" name="metodo_pago" value="oxxo" />
                                    <label for="oxxo">Oxxo</label>
                                </div>
                                <div class="radios">
                                    <input type="radio" id="transferencia" name="metodo_pago" value="transferencia" />
                                    <label for="transferencia">Transferencia Bancaria</label>
                                </div>
                        </div>
                    </div>
                    <div class="segundo-cont">
                        <div class="contoF">
                            <label for="costoFinal">Costo Final</label>
                            <input type="text" id="costoFinal" name="costoFinal" readonly style="background-color: #e9ecef; font-weight: bold; padding: 5px;" />
                            <label></label>
                            <label></label>
                            <label></label>
                            <label></label>
                            <!-- Para que se vea mas Chico el Costo final-->
                        </div>
                        <div class="botones">
                            <button type="button" class="btn-cancelar" onclick="window.location.href = 'carritoCompras.jsp'">
                                Volver al Carrito
                            </button>
                            <button type="button" id="btnConfirmarPedido" class="btn-confirmar">
                                Confirmar y Pagar
                            </button>
                        </div>
                    </div>
                </div>

                <div id="containerPg" class="piePagina">
                    <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
                </div>
            </div>
        </main>
        <script>
            const ID_USUARIO_ACTIVO = <%= (session.getAttribute("clienteLogueado") != null) ? ((negocio.Usuario)session.getAttribute("clienteLogueado")).getId() : "null" %>;
        </script>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/procesoCompra.js"></script>
    </body>
</html>
