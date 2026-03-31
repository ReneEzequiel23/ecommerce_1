<%@page import="java.util.List"%>
<%@page import="negocio.Resena"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrar reseñas</title>
    <link rel="stylesheet" href="css/gestionarReseñas.css" />
    <link rel="stylesheet" href="css/styles.css" />
  </head>
  <body>
        <!-- Pagina Principal -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa López 228691 -->
        <div class="containPP">
            <div id="containerPg" class="barraSuperior">
                <nav>
                    <ul>
                        <li>
                            <div class="perfil">
                                <input type="image" src="Img/perfil.png" alt="Perfil" />
                                <ul>
                                    <li><a href="perfilUsuario.jsp">Perfil</a></li>
                                    <li><a href="LogoutServlet">Cerrar Sesión</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <div id="containerPg" class="menuLateral">
                <div class="menu">
                    <ul>
                        <li class="page"><a href="index.jsp">Inicio</a></li>
                        <li class="page">
                            <a href="catalogoProductos.jsp">Catálogo (Vista Cliente)</a>
                        </li>
                        <li class="page"><a href="carritoCompras.jsp">Carrito de Compras</a></li>
                        <li class="page">
                            <a href="gestionDePedidos.jsp">Gestión de Pedidos</a>
                        </li>
                        <li class="page">
                            <a href="admin_dashboard.jsp" style="background-color: #999">Administrador</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="containerPg" class="contenido area-admin-reseña">
                <h2 class="titulo-admin">Administrar Reseñas</h2>

                <div class="caja-tabla-admin">
                    <table class="tabla-admin">
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

                                // Si la lista no es nula, la recorremos
                                if (resenas != null && !resenas.isEmpty()) {
                                    for (Resena p : resenas ){
                            %>
                            <tr>
                                <td><%= p.getUsuario_id()%></td>
                                <td><%= p.getProducto_id() %></td>
                                <td><%= p.getCalificacion()%></td>
                                <td><%= p.getFecha() %> </td>
                                <td class="celda-acciones">
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
                </div>
            </div>

            <div id="containerPg" class="piePagina">
                 <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
            </div>
        </div>
    </body>
</html>

