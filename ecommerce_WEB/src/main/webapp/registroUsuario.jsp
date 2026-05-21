<%-- 
    Document   : registroUsuario
    Created on : 14 may 2026, 4:25:13 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
            <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Registro de usuario</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/stylesInicioSesion.css" />
        <link rel="stylesheet" href="css/direccionStyle.css" />
    </head>
    <body>
        <!-- Registro de usuario -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa López 228691 -->
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
                <form action="UsuarioServlet" method="POST">
                    <div class="grupo-form">
                        <label for="nombre">Nombre</label>
                        <input type="text" id="nombre" name="nombre" required />
                    </div>
                    <div class="grupo-form">
                        <label for="correo">Correo Electrónico</label>
                        <input
                            type="email"
                            id="correo"
                            name="correo"
                            placeholder="Example@example.com"
                            required />
                    </div>
                    <div class="grupo-form">
                        <label for="telefono">Numero Teléfono</label>
                        <input type="tel" id="telefono" name="telefono" required />
                    </div>

                    <div class="grupo-form">
                        <label for="password">Contraseña</label>
                        <input type="password" id="contrasena" name="contrasena" required />
                    </div>
                    <div class="grupo-form">
                        <label for="confirm_password">Confirmar Contraseña</label>
                        <input type="password" id="confirm_password" name="confirm_password" required />
                    </div>
                    <div class="botones-registro">
                        <button
                            type="button"
                            class="btn-cancelar"
                            onclick="window.location.href = '<%= request.getContextPath()%>/PantallaAgregar.html'" 
                            style="background-color: #c92c3e;border: 2px solid #a62b39;color: #eae1e3;
                            padding: 8px 30px;cursor: pointer;">
                            Cancelar
                        </button>
                            <button type="submit" class="btn-crear" 
                                    style="background-color: #4b8166;border: 2px solid #1f4d40;color: #eae1e3;
                                    padding: 8px 30px;cursor: pointer;"
                                    >Crear Cuenta</button>
                            <--<!-- Aqui sera que cuando lo agregue se abra otra pantalla para agregarle la direccion -->
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/direccionJs.js"></script>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
