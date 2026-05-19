<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="css/PantallaOrigen.css" />
    <link rel="stylesheet" href="css/stylesInicioSesion.css" />
  </head>
  <body>
      <!-- Pagina Principal -->
    <!-- Edgar Arturo Acevedo Acosta 245769
          Rene Ezequiel Figueroa LÃ³pez 228691 -->
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
        <a href="catalogoProductos.jsp">Catálogo</a>
        <a href="carritoCompras.jsp">Carrito</a>
        <a href="gestionDePedidos.jsp">Pedidos</a>
        <a href="administradorPantalla.jsp">Administrador</a>
    </div>

    <main>
        <div class="tarjeta-login" style="background: #3d3d3d;">
            <h2>Iniciar Sesión</h2>
            <form action="LoginServlet" method="POST">
                <% if (request.getAttribute("errorLogin") != null) {%>
                <p style="color: #d9534f; text-align: center; font-weight: bold;">
                    <%= request.getAttribute("errorLogin")%>
                </p>
                <% }%>
                <div class="grupo-form">
                    <label for="correo">Correo Electrónico</label>
                    <input type="email" id="correo" name="correo" required />
                </div>
                <div class="grupo-form">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="contraseña" required />
                </div>
                <button type="submit" class="btn-iniciar">Iniciar Sesión</button>
            </form>
            <a href="<%= request.getContextPath()%>/registroUsuario.jsp" class="link-registro">Registrarse</a>
            <br />
            <button type="button" onclick="window.location.href = '<%= request.getContextPath()%>/PantallaAgregar.html'" class="btn-regresar"
                    style="background-color: #c92c3e;border: 2px solid #a62b39;color: #eae1e3;">
                Regresar
            </button>
        </div>
    </main>

    <footer class="footer">Aplicaciones Web - Unidad 2</footer>
    <script src="javascript/MenuScript.js"></script>
  </body>
</html>