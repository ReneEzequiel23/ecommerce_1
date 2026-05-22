<%@page import="negocio.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Gestión de Pedidos</title>
      <link rel="stylesheet" href="css/PantallaOrigen.css" />
      <link rel="stylesheet" href="css/pedidos.css" />
    </head>
    <body>
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
            <h2 style="padding: 20px;">Pedidos Hechos</h2>
            <div class="caja-pedidos" style="background: #3d3d3d; ">
                <form action="PedidosSerlet" method="GET">
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
                                <td><%= p.getTotal()%></td>
                                <td>$<%= p.getEstado()%></td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="5" style="text-align: center;">No hay Pedidos registrados.</td></tr>
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
