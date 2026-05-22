<%-- 
    Document   : administrarPedidos
    Created on : 21 may 2026, 3:15:22 p.m.
    Author     : edgar
--%>
<%@page import="persistencia.UsuarioDAO"%>
<%@page import="negocio.Usuario"%>
<%@page import="negocio.Pedido"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Administrar Pedidos</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css"/>
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
                                <th>Usuario</th>
                                <th>Pedido</th>
                                <th>Fecha de compra</th>
                                <th>Total pagado</th>
                                <th>Estado</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Recuperamos la lista que nos mandó el Servlet
                                List<Pedido> pedidos = (List<Pedido>) request.getAttribute("listaPedidodos");
                                UsuarioDAO users = new UsuarioDAO();
                                // Si la lista no es nula, la recorremos
                                if (pedidos != null && !pedidos.isEmpty()) {
                                    for (Pedido p : pedidos) {
                                    Usuario us= users.obtenerPorId(p.getUsuario_id());
                            %>
                            <tr>
                                <td><%= us.getNombre() %></td>
                                <td><%= p.getId()%></td>
                                <td><%= p.getFecha()%></td>
                                <td>$ <%= p.getTotal()%></td>
                                <td><%= p.getEstado()%></td>
                                <td class="celda-acciones">
                                    <button type="button" class="btn-estado"style="background-color:#3992d5; border: 2px solid #1c6eba; 
                                            padding: 8px; width: 140px; height: 50px; color:white; "
                                            onclick="if (confirm('¿Seguro que deseas cambiarle el estado a este Pedido?'))
                            window.location.href = 'PedidosSerlet?accion=editar&id=<%= p.getId()%>'"
                                            >Cambiar Estado</button>
                                </td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="6" style="text-align: center;">No hay Pedidos registrados.</td></tr>
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
