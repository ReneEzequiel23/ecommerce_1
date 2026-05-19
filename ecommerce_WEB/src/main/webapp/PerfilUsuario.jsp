<%-- 
    Document   : PerfilUsuario
    Created on : 19 may 2026, 3:47:12 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Usuario</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/perfil.css" />
    </head>
    <body>
        <header>
            <button id="toggleSidebar">☰ Menu</button>
            <div class="profile">
                <img src="Img/perfil.png" id="profilePic" alt="Perfil" />
                <div id="profileMenu" class="dropdown hidden">
                    <a href="inicioDeSesion.jsp">Iniciar Sesión</a>
                    <a href="perfilUsuario.jsp">Perfil</a>
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

        <main >
            <div class="tarjeta-perfil" style="background-color:#1c1c1c;  padding: 40px">
                <h2>Perfil</h2>
                <form action="#" method="POST">
                    <div class="grupo-form">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="nombre"/>
                    </div>
                    <div class="grupo-form">
                        <label for="correo">Correo Electrónico</label>
                        <input type="email" id="correo" name="correo"/>
                    </div>
                    <div class="grupo-form">
                        <label for="telefono">Número de Teléfono</label>
                        <input type="tel" id="telefono" name="telefono"/>
                    </div>
                    <div class="grupo-form">
                        <label for="direccion">Dirección del Envío</label>
                        <input type="text" id="direccion" name="direccion"/>
                    </div>
                    <button type="submit" class="btn-actualizar" style="left: 30%;" >Actualizar</button>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
