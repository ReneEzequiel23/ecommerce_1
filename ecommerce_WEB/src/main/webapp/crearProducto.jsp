<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Crear Producto</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/styles.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminProducto.css" />
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
            <li class="page"><a href="<%= request.getContextPath() %>/catalogoProductos.jsp">Catálogo Cliente</a></li>
            <li class="page"><a href="<%= request.getContextPath() %>/carritoCompras.jsp">Carrito</a></li>
            <li class="page"><a href="<%= request.getContextPath() %>/gestionDePedidos.jsp">Pedidos</a></li>
            <li class="page"><a href="<%= request.getContextPath() %>/ProductoServlet" style="background-color: #999">Administrador</a></li>
          </ul>
        </div>
      </div>

      <div id="containerPg" class="contenido">
        <div class="tarjeta-producto">
          <h2>Crear Nuevo Libro</h2>
          
          <form action="<%= request.getContextPath() %>/ProductoServlet" method="POST">
            
            <div class="grupo-form">
              <label for="nombre">Título del Libro</label>
              <input type="text" id="nombre" name="nombre" required />
            </div>
            
            <div class="grupo-form">
              <label for="descripcion">Descripción / Autor</label>
              <textarea name="descripcion" id="descripcion" required></textarea>
            </div>
            
            <div class="grupo-form">
              <label for="precio">Precio ($)</label>
              <input type="number" id="precio" name="precio" step="0.01" required />
            </div>
            
            <div class="grupo-form">
              <label for="cantidad">Cantidad en Stock</label>
              <input type="number" id="cantidad" name="cantidad" min="0" required />
            </div>

            <div class="grupo-form">
              <label for="categoria">Categoría</label>
              <select name="categoria" id="categoria" required style="width: 100%; padding: 8px;">
                  <option value="1">Fantasía</option>
                  <option value="2">Ciencia Ficción</option>
                  <option value="3">Tecnología y Programación</option>
                  <option value="4">Novela Histórica</option>
                  <option value="5">Terror</option>
              </select>
            </div>

            <button type="submit" class="btn-crear">Crear Libro</button>
            <button type="button" class="btn-crear" style="background-color: #6c757d; margin-top:10px;" onclick="window.location.href='<%= request.getContextPath() %>/ProductoServlet'">Cancelar</button>
          </form>
        </div>
      </div>

      <div id="containerPg" class="piePagina">
        <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
      </div>
    </div>
  </body>
</html>