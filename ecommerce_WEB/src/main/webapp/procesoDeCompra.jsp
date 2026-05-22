<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Proceso de Compra</title>
        <link rel="stylesheet" href="css/styles.css" />
        <link rel="stylesheet" href="css/procesoCompra.css" />
    </head>
    <body>
        <!-- Pagina Principal -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa LÃ³pez 228691 -->
    <body>
        <header>
            <button id="toggleSidebar">Menu</button>
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
            <div class="primer-cont">
                <div class="caja-tabla">
                    <table class="tabla-productos">
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
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/procesoCompra.js?v=2"></script>
    </body>
</html>
