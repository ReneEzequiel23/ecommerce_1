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
        <title>JSP Page</title><title>Administrar usuarios</title>
        <link rel="stylesheet" href="css/administrarUsuarios.css" />
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
                                    <!-- Tengo que Arreglar Este Css por que Solo se Activa
                                       Cuando Tienes Presionado el Click en el Perfil 
                                       y Aparece a la Izquierda xdddd-->
                                    <li><a href="perfilUsuario.html">Perfil</a></li>
                                    <li><a href="inicioDeSesion.jsp">Cerrar Sesión</a></li>
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
                            <a href="catalogoProductos.html">Catalogo de Productos</a>
                        </li>
                        <li class="page"><a href="carritoCompras.html">Carrito de Compras</a></li>
                        <li class="page">
                            <a href="gestionDePedidos.html">Gestión de Pedidos</a>
                        </li>
                        <li class="page">
                            <a href="administradorPantalla.html">Administrador</a>
                        </li>
                        <li class="page"><a href="inicioDeSesion.html">Iniciar Sesión</a></li>
                    </ul>
                </div>
            </div>
            <div id="containerPg" class="contenido area-admin-usuarios">
                <h2 class="titulo-admin">Administrar Usuarios</h2>

                <div class="caja-tabla-admin">
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
                                List<Usuario> usuarios = (List<Usuario>) request.getAttribute("listaUsuarios");

                                // Si la lista no es nula, la recorremos
                                if (usuarios != null && !usuarios.isEmpty()) {
                                    for (Usuario p : usuarios) {
                            %>
                            <tr>
                                <td><%= p.getId()%></td>
                                <td><%= p.getNombre()%></td>
                                <td><%= p.getCorreo()%></td>
                                <td><%= p.getRol()%></td>
                                <td><%= p.isActivo()%></td>
                                <td class="celda-acciones">
                                    <button type="button" class="btn-estado"
                                            onclick="if (confirm('¿Seguro que deseas cambiarle el estado a este Usuario?'))
                                      window.location.href = 'AdministrarUsuarioServlet?accion=editar&id=<%= p.getId()%>'"
                                            >Cambiar Estado</button>
                                    <button type="button" class="btn-eliminar"
                                            onclick="if (confirm('¿Seguro que deseas eliminar este Usuario?'))
                                      window.location.href = 'AdministrarUsuarioServlet?accion=eliminar&id=<%= p.getId()%>'"
                                    >Eliminar</button>
                                </td>
                            </tr>
                            <%
                                } // Fin del for
                            } else {
                            %>
                            <tr><td colspan="5" style="text-align: center;">No hay productos registrados.</td></tr>
                            <%} %>
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
