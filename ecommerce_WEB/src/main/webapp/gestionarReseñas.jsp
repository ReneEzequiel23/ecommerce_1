<%@page import="negocio.Producto"%>
<%@page import="negocio.Usuario"%>
<%@page import="persistencia.ProductoDAO"%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="negocio.Resena"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrar reseñas</title>
    <link rel="stylesheet" href="css/gestionarReseñas.css" />
    <link rel="stylesheet" href="css/PantallaOrigen.css" />
  </head>
  <body>
        <!-- Pagina Principal -->
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
            <h2 style="color: #eae1e3;">Administrar Reseñas</h2>
            <br></br>
            <div class="caja-tabla-admin">
                <form action="ResenaServlet" method="GET">
                    <table class="tabla-admin" style="background: #3d3d3d; " >
                        <thead>
                            <tr>
                                <th>Usuario</th>
                                <th>Producto</th>
                                <th>Calificacion</th>
                                <th>Fecha</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Recuperamos la lista que nos mandó el Servlet
                                List<Resena> resenas = (List<Resena>) request.getAttribute("listaResenas");
                                UsuarioDAO users = new UsuarioDAO();
                                ProductoDAO prod=new ProductoDAO();
                                // Si la lista no es nula, la recorremos
                                if (resenas != null && !resenas.isEmpty()) {
                                    for (Resena p : resenas) {
                                    Usuario us=users.obtenerPorId(p.getUsuario_id());
                                    Producto pr=prod.obtenerPorId(p.getProducto_id());
                            %>
                            <tr>
                                <td><%= us.getNombre()%></td>
                                <td><%= pr.getNombre()%></td>
                                <td><%= p.getCalificacion()%></td>
                                <td><%= p.getFecha()%> </td>
                                <td class="celda-acciones">
                                    <button type="button" class="btn-estado" style="background-color: #8bb7e9"
                                            onclick="window.location.href = 'verResena.jsp?id=<%= p.getId()%>'">
                                        Ver Reseña</button>
                                    <button type="button" class="btn-eliminar" style="background-color: #d9534f; color: white;"
                                            onclick="if (confirm('¿Seguro que deseas eliminar este Reseña?'))
                          window.location.href = 'ResenaServlet?accion=eliminar&id=<%= p.getId()%>'">
                                        Eliminar
                                    </button>
                                </td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="5" style="text-align: center;">No hay Reseñas registradas.</td></tr>
                            <% }%>
                        </tbody>
                    </table>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>

