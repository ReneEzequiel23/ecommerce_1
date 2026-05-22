<%-- 
    Document   : verResena
    Created on : 22 may 2026, 1:21:51 a.m.
    Author     : edgar
--%>
<%@page import="java.util.List"%>
<%@page import="negocio.Resena"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Ver Resena</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css"/>
        <link rel="stylesheet" href="css/perfil.css" />
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

        <main style="display: flex;justify-content: center;align-items: center;">
            <div class="tarjeta-perfil" style="background-color:#1c1c1c;  padding: 40px">
                <h2>Reseña</h2>
                <form action="#" method="GET">
                    <div class="grupo-form">
                        <label for="nombre">Nombre Usuario</label>
                        <input type="text" id="nombre" name="nombre" disabled="true" style="background-color: white"/>
                    </div>
                    <div class="grupo-form">
                        <label for="producto">Nombre Producto</label>
                        <input type="text" id="producto" name="producto" disabled="true" style="background-color: white"/>
                    </div>
                    <div class="grupo-form">
                        <label for="calificacion">Calificación</label>
                        <input type="text" id="calificacion" name="calificacion" disabled="true" style="background-color: white;"/>
                    </div>
                    <div class="grupo-form">
                        <label for="comentario">Reseña</label>
                    </div>
                    <div class="grupo-form">
                        <textarea id="comentario" name="comentario" disabled="true" style="background-color: white; width: 100%; height: 120px;" ></textarea>
                    </div>
                    <!-- boton de eliminar -->
                    <button
                        type="button"
                        class="btn-cancelar"
                        onclick="window.location.href = '/configurarDireccion.jsp'" 
                        style="background-color: #c92c3e;border: 2px solid #a62b39;color: #eae1e3;
                            padding: 8px 30px;cursor: pointer;">
                        Cancelar
                    </button>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
