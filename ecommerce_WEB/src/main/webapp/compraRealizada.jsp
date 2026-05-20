<%-- 
    Document   : compraRealizada
    Created on : 19 may 2026, 6:28:10 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprea Realizada</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/ticket.css" />
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
            <div class="tarjeta-confirmacion">
                <form action="#" method="GET">
                    <h2 class="titulo-compra">Compra Realizada</h2>

                    <div class="contenedor-datos">
                        <div class="fila-dato">
                            <span class="etiqueta-dato">Numero Pedido</span>
                            <span class="valor-dato">X</span>
                        </div>

                        <div class="fila-dato">
                            <span class="etiqueta-dato">Dirección de Entrega</span>
                            <span class="valor-dato">Texto de Ejemplo</span>
                        </div>

                        <div class="fila-dato">
                            <span class="etiqueta-dato">Fecha de Compra</span>
                            <span class="valor-dato">10/09/2025</span>
                        </div>

                        <div class="fila-dato">
                            <span class="etiqueta-dato">Costo Final</span>
                            <span class="valor-dato">XXX.XX</span>
                        </div>
                    </div>

                    <div class="contenedor-boton">
                        <button type="button" class="btn-regresar" onclick="window.location.href = 'PantallaAgregar.html'">
                            Regresar
                        </button>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
