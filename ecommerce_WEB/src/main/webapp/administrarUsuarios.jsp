<%-- 
    Document   : administrarUsuarios
    Created on : 14 may 2026, 1:48:17 p.m.
    Author     : edgar
--%>
<%@page import="java.util.List"%>
<%@page import="negocio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Administrar usuarios</title>
        <link rel="stylesheet" href="css/administrarUsuarios.css" />
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

        <div id="sidebar"☰ class="sidebar">
            <a href="PantallaAgregar.html">Inicio</a>
            <a href="catalogoProductos.jsp">Catálogo de Productos</a>
            <a href="carritoCompras.jsp">Carrito de Compras</a>
            <a href="gestionDePedidos.jsp">Gestion de Pedidos</a>
            <a href="administradorPantalla.jsp">Administrador</a>
        </div>

        <main>
            <h2 class="titulo-admin" style="color: #eae1e3;">Administrar Usuarios</h2>
            <div class="caja-tabla-admin">
                <form action="UsuarioServlet" method="GET">
                    <table class="tabla-admin">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Correo Electrónico</th>
                                <th>Rol</th>
                                <th>Estado de Cuenta</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Recuperamos la lista que nos mandó el Servlet
                                List<Usuario> usuariosA = (List<Usuario>) request.getAttribute("listaUsuariosaDMIN");
                                // Si la lista no es nula, la recorremos
                                if (usuariosA != null && !usuariosA.isEmpty()) {
                                    for (Usuario p : usuariosA) {
                                    
                            %>
                            <tr>
                                <td style="color: #1d1d2a"><%= p.getId()%></td>
                                <td style="color: #1d1d2a"><%= p.getNombre()%></td>
                                <td style="color: #1d1d2a"><%= p.getCorreo()%></td>
                                <td style="color: #1d1d2a"><%= p.getRol()%></td>
                                <td style="color: #1d1d2a"><%= p.isActivo()%></td>
                                <td class="celda-acciones">
                                    <button type="button" class="btn-estado"
                                            onclick="if (confirm('¿Seguro que deseas cambiarle el estado a este Usuario?'))
                            window.location.href = 'UsuarioServlet?accion=editar&id=<%= p.getId()%>'"
                                            >Cambiar Estado</button>
                                    <button type="button" class="btn-eliminar"
                                            onclick="if (confirm('¿Seguro que deseas eliminar este Usuario?'))
                            window.location.href = 'UsuarioServlet?accion=eliminar&id=<%= p.getId()%>'"
                                            >Eliminar</button>
                                </td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="5" style="text-align: center; color: #1d1d2a">No hay productos registrados.</td></tr>
                            <%}%>
                        </tbody>
                    </table>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
