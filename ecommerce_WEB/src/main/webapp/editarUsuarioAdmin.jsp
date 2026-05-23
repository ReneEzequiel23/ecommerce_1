<%-- 
    Document   : editarUsuarioAdmin
    Created on : 22 may 2026, 8:40:39 p.m.
    Author     : edgar
--%>
<%@page import="negocio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/PantallaOrigen.css"/>
        <link rel="stylesheet" href="css/stylesInicioSesion.css" />
        <title>Editar Usuario</title>
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
            <h2>Editar Perfil</h2>
            <div class="tarjeta-login">
                
                <form id="formularioEditar" style="color: black;">
                    <div class="grupo-form">
                        <label for="rol">Rol:</label>
                        <select id="rol" name="rol" required style="position: static;
                                width: 30%;
                                padding: 8px;
                                border: 2px solid #888;">
                            <option id="rol" value="admin" style="text-align: right;">Admin</option>
                            <option id="rol" value="cliente" style="text-align: right;">Cliente</option>
                        </select>
                    </div>
                    <div class="grupo-form">
                        <label for="activo">Activo:</label>
                        <select id="activo" name="activo" required style="position: static;
                                width: 30%;
                                padding: 8px;
                                border: 2px solid #888;">
                            <option id="rol" value="true" style="text-align: right;">Activo</option>
                            <option id="rol" value="false" style="text-align: right;">Inactivo</option>
                        </select>
                    </div>
                    <button type="submit" class="btn-iniciar">Guardar Cambios</button>
                    <br></br>
                    <button type="button" class="btn-regresar" onclick="window.location.href='UsuarioServlet'">Cancelar</button>
                </form>
            </div>
        </main>
        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/editarUsuario"></script>
    </body>
</html>
