<%-- 
    Document   : carritoCompras
    Created on : 19 may 2026, 5:55:17 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Carrito de Compras</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/carrito.css" />
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
            <h2>Carrito de Compras</h2>
            <div class="caja-carrito">
                <form id="formularioCarrito">
                    <table class="tabla-carrito" style="background: #3d3d3d;">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="cuerpoCarrito">
                            
                        </tbody>
                    </table>
                </form>
            </div>

            <div class="seccion-pago">
                <div class="fila-total">
                    <span class="etiqueta-total">Costo Final</span>
                    <input type="text" id="costoTotal" value="$0.00" readonly class="input-total" disabled="true" style="padding: 8px; 
                           background-color: white"/>
                </div>
                <button
                    type="button"
                    class="btn-pagar"
                    onclick="window.location.href = 'procesoDeCompra.jsp'">
                    Pagar
                </button>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/carrito.js"></script>
    </body>
</html>
