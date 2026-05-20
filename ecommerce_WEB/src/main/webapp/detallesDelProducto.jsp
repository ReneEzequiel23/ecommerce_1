<%-- 
    Document   : detallesDelProducto
    Created on : 19 may 2026, 7:03:27 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Detalles del Producto</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/detalle.css" />
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
            <div class="tarjeta-detalles">
                <form id="formDetalles" action="UsuarioServlet" method="POST">
                    <h2 class="titulo-producto">Nombre de Libro</h2>

                    <h3 class="subtitulo">Descripción General</h3>
                    <p class="texto-descripcion">
                        Texto de Ejemplo: Aquí viene lo que es la descripción y sus características
                    </p>

                    <h3 class="subtitulo">Reseñas</h3>

                    <form id="ResenasForm" >
                        <div class="caja-resena">
                            <h4 class="usuario-resena">Usuario1 <span class="estrellas">&#9733;&#9733;&#9733;&#9733;&#9734;</span></h4>
                            <p class="texto-resena">
                                Lorem ipsum dolor sit amet consectetur adipiscing elit vulputate enim, fringilla vitae est tellus.
                            </p>
                            <span class="fecha-resena">08/10/2026</span>
                        </div>

                        <div class="caja-resena">
                            <h4 class="usuario-resena">Usuario2 <span class="estrellas">&#9733;&#9733;&#9733;&#9734;&#9734;</span></h4>
                            <p class="texto-resena">
                                Lorem ipsum dolor sit amet consectetur adipiscing elit vulputate enim, fringilla vitae est tellus.
                            </p>
                            <span class="fecha-resena">08/10/2026</span>
                        </div>
                    </form>

                    <h3 class="subtitulo">Disponibilidad de Existencias</h3>
                    <p class="texto-cantidad">(Cantidad)</p>

                    <div class="contenedor-boton">
                        <button type="button" class="btn-regresar"
                                onclick="window.location.href='catalogoProductos.html'">Regresar</button>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
