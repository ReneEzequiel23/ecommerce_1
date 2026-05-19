<%@page import="java.util.List"%>
<%@page import="negocio.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Administrar Productos</title>
        <link rel="stylesheet" href="css/gestionarProductos.css" />
        <link rel="stylesheet" href="css/styles.css" />
        
    </head>
    <body>
        <!-- Pagina Principal -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa LÃ³pez 228691 -->
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

            <div id="containerPg" class="contenido area-admin-productos">
                <h2 class="titulo-admin">Gestión del Catálogo de Productos</h2>

                <button class="btn-agregar" style="margin-bottom: 15px; background-color: #5cb85c; color: white; padding: 10px; border: none; cursor: pointer;" 
                        onclick="window.location.href = 'crearProducto.jsp'">
                    + Crear Nuevo Producto
                </button>

                <div class="caja-tabla-admin">
                    <table class="tabla-admin" style="width: 100%; text-align: left;">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Precio</th>
                                <th>Stock</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="cuerpoTabla">
                        </tbody>
                    </table>
                    <script src="javascript/catalogoAdmin.js"></script>
                </div>
            </div>

            <div id="containerPg" class="piePagina">
                <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
            </div>
        </div>
    </body>
</html>