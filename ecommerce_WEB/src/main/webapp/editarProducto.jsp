<%@page import="negocio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Recuperamos el producto que nos mandó el Servlet
    Producto producto = (Producto) request.getAttribute("producto");
    
    // Si por alguna razón entran directo a la página sin un producto, los regresamos
    if(producto == null) {
        response.sendRedirect("ProductoServlet?accion=listar");
        return;
    }
%>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Editar Producto</title>
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
          <h2>Editar Producto: <%= producto.getNombre() %></h2>
          
          <form action="<%= request.getContextPath() %>/ProductoServlet?accion=actualizar" method="POST">
            
            <input type="hidden" name="id" value="<%= producto.getId() %>" />

            <div class="grupo-form">
              <label for="nombre">Nombre</label>
              <input type="text" id="nombre" name="nombre" value="<%= producto.getNombre() %>" required />
            </div>
            
            <div class="grupo-form">
              <label for="descripcion">Descripción</label>
              <textarea name="descripcion" id="descripcion" required><%= producto.getDescripcion() %></textarea>
            </div>
            
            <div class="grupo-form">
              <label for="precio">Precio</label>
              <input type="number" id="precio" name="precio" step="0.01" value="<%= producto.getPrecio() %>" required />
            </div>
            
            <div class="grupo-form">
              <label for="cantidad">Cantidad en Stock</label>
              <input type="number" id="cantidad" name="cantidad" min="0" value="<%= producto.getExistencia() %>" required />
            </div>

            <div class="grupo-form">
              <label for="categoria">Categoría</label>
              <select name="categoria" id="categoria" required style="width: 100%; padding: 8px;">
                  <option value="1" <%= producto.getCategoriaId() == 1 ? "selected" : "" %>>Fantasía</option>
                  <option value="2" <%= producto.getCategoriaId() == 2 ? "selected" : "" %>>Ciencia Ficción</option>
                  <option value="3" <%= producto.getCategoriaId() == 3 ? "selected" : "" %>>Tecnología y Programación</option>
                  <option value="4" <%= producto.getCategoriaId() == 4 ? "selected" : "" %>>Novela Histórica</option>
                  <option value="5" <%= producto.getCategoriaId() == 5 ? "selected" : "" %>>Terror</option>
              </select>
            </div>

            <button type="submit" class="btn-actualizar">Actualizar Libro</button>
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