<%@page import="negocio.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Carrito de Compras</title>
      <link rel="stylesheet" href="css/styles.css" />
      <link rel="stylesheet" href="/css/pedidos.css" />
    </head>

    <body>
        <div class="containPP">
            <div id="containerPg" class="barraSuperior">
                <nav>
                    <ul>
                        <li>
                            <div class="perfil">
                                <input type="image" src="../Img/perfil.png" alt="Perfil" />
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

            <div id="containerPg" class="contenido area-pedidos">
                <div class="caja-pedidos">
                    <table class="tabla-pedidos">
                        <thead>
                            <tr>
                                <th>Pedido</th>
                                <th>Fecha de compra</th>
                                <th>Total pagado</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <%
                                // Recuperamos la lista que nos mandó el Servlet
                                List<Pedido> pedidos = (List<Pedido>) request.getAttribute("listaPedidods");

                                // Si la lista no es nula, la recorremos
                                if (pedidos != null && !pedidos.isEmpty()) {
                                    for (Pedido p : pedidos) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%= p.getFecha()%></td>
                                <td><%= p.getTotal() %></td>
                                <td>$<%= p.getEstado() %></td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="5" style="text-align: center;">No hay Pedidos registrados.</td></tr>
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
