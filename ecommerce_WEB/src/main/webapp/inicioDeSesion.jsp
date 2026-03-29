<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/stylesInicioSesion.css" />
  </head>
  <body>
    <div class="containPP">
      <div id="containerPg" class="barraSuperior">
        <nav>
          <ul>
            <li>
              <div class="perfil">
                <input type="image" src="<%= request.getContextPath() %>/Img/perfil.png" alt="Perfil" />
                <ul>
                  <li><a href="<%= request.getContextPath() %>/perfilUsuario.jsp">Perfil</a></li>
                  <li><a href="<%= request.getContextPath() %>/LogoutServlet">Cerrar Sesión</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </nav>
      </div>

      <div id="containerPg" class="menuLateral">
        <div class="menu">
          <ul>
            <li class="page"><a href="<%= request.getContextPath() %>/index.jsp">Inicio</a></li>
            <li class="page">
              <a href="<%= request.getContextPath() %>/catalogoProductos.jsp">Catalogo de Productos</a>
            </li>
            <li class="page"><a href="<%= request.getContextPath() %>/carritoCompras.jsp">Carrito de Compras</a></li>
            <li class="page">
              <a href="<%= request.getContextPath() %>/gestionDePedidos.jsp">Gestión de Pedidos</a>
            </li>
            <li class="page">
              <a href="<%= request.getContextPath() %>/admin_dashboard.jsp">Administrador</a>
            </li>
            <li class="page">
              <a href="<%= request.getContextPath() %>/inicioDeSesion.jsp" style="background-color: #999">Iniciar Sesión</a>
            </li>
          </ul>
        </div>
      </div>

      <div id="containerPg" class="contenido">
        <div class="tarjeta-login">
          <h2>Iniciar Sesión</h2>
          
          <form action="<%= request.getContextPath() %>/LoginServlet" method="POST">
            
            <% if(request.getAttribute("errorLogin") != null) { %>
                <p style="color: #d9534f; text-align: center; font-weight: bold;">
                    <%= request.getAttribute("errorLogin") %>
                </p>
            <% } %>

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
          
          <a href="<%= request.getContextPath() %>/registroUsuario.jsp" class="link-registro">Registrarse</a>
          <br />
          <button type="button" onclick="window.location.href = '<%= request.getContextPath() %>/index.jsp'" class="btn-regresar">
            Regresar
          </button>
        </div>
      </div>

      <div id="containerPg" class="piePagina">
        <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
      </div>
    </div>
  </body>
</html>