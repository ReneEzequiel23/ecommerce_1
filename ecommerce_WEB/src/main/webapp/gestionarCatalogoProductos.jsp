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
            <h2 class="titulo-admin" style="color: #eae1e3;">Gestión del Catálogo de Productos</h2>

            <button
                class="btn-agregar"
                style="
        margin-bottom: 15px;
        background-color: #5cb85c;
        color: white;
        padding: 10px;
        border: none;
        cursor: pointer;
                "
                onclick="window.location.href = 'crearProducto.jsp'">
                + Crear Nuevo Producto
            </button>
            </br>
            <button
                class="btn-agregar"
                style="
        margin-bottom: 15px;
        background-color: #4f7d4f;
        color: white;
        padding: 12px 40px;
        border: 2px solid #2e492d;
        cursor: pointer;
                "
                onclick="window.location.href = 'crearCategoria.jsp'">
                + Crear Nueva Categoria
            </button>

            <div class="caja-tabla-admin">
                <table class="tabla-admin" style="width: 100%; text-align: left">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="cuerpoTabla" style="color: #1d1d2a;"></tbody>
                </table>
                <script src="javascript/catalogoAdmin.js"></script>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>