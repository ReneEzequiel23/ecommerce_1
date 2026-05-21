<%-- 
    Document   : configurarDireccion
    Created on : 19 may 2026, 8:30:51 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Configuración de Dirección</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css"/>
        <link rel="stylesheet" href="css/stylesInicioSesion.css" />
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
            <div class="tarjeta-login"  style="background: #3d3d3d; width: 700px;">
                <h2>Registrarse</h2>
                <form action="DireccionServlet" method="POST">
                    <!-- Hacerlo o botno para que pueda poner la dirección o hacerlo 
                                    mas grande -->
                    <div class="grupo-form">
                        <label>Calle:</label>
                        <input type="text"id="calle" required />
                    </div>
                    <div class="grupo-form">
                        <label>Ciudad</label>
                        <input type="text"id="ciudad" required />
                    </div>
                    <div class="grupo-form">
                        <label>Estado</label>
                        <input type="text" id="estado" required >
                    </div>
                    <div class="grupo-form">
                        <label>Codigo Postal</label>
                        <input type="text" id="codigo" required />
                    </div>
                    <div class="botones-registro">
                        <button
                            type="button"
                            class="btn-cancelar"
                            onclick="window.location.href = '<%= request.getContextPath()%>/PerfilUsuario.jsp'" 
                            style="background-color: #c92c3e;border: 2px solid #a62b39;color: #eae1e3;
                            padding: 8px 30px;cursor: pointer;">
                            Cancelar
                        </button>
                        <button type="submit" class="btn-crear" 
                                style="background-color: #4b8166;border: 2px solid #1f4d40;color: #eae1e3;
                                    padding: 8px 30px;cursor: pointer;"
                                >Crear Cuenta</button>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
