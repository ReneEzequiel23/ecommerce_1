<%-- 
    Document   : crearCategoria
    Created on : 19 may 2026, 7:13:11 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Crear Categoria</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css"/>
        <link rel="stylesheet" href="css/stylesInicioSesion.css" />
    </head>
    <body>
        <!-- Pantalla administrador -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa LÃ³pez 228691 -->
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
            <div class="tarjeta-login" style="background: #3d3d3d;">
                <h2>Crear Categoria</h2>
                <form action="CategoriaServlet" method="POST">                    
                    <div class="grupo-form">
                        <label for="nombre">Nombre Categoria</label>
                        <input type="text" id="nombre" name="nombre" required />
                    </div>
                    <button type="submit" class="btn-iniciar" style="width: 40%; background-color: #7ce086;
                            border: 2px solid #4bb856; padding: 12px 40px; ursor: pointer;">Crear</button>
                            <br><br />
                    <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/gestionarCatalogoProductos.jsp'" class="btn-regresar"
                            style="background-color: #c92c3e;border: 2px solid #a62b39;color: #eae1e3; padding: 12px 40px;">
                        Regresar
                    </button>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
