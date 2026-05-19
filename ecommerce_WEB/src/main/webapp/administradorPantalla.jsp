<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrador</title>
    <link rel="stylesheet" href="css/PantallaOrigen.css" />
    <link rel="stylesheet" href="css/administrador.css" />
  </head>
  <body>
    <!-- Pantalla administrador -->
    <!-- Edgar Arturo Acevedo Acosta 245769
          Rene Ezequiel Figueroa LÃ³pez 228691 -->
    <header>
        <button id="toggleSidebar">Menu</button>
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
        <a href="gestionarCatalogoProductos.jsp">Catálogo de Productos</a>
        <a href="carritoCompras.jsp">Carrito de Compras</a>
        <a href="gestionDePedidos.jsp">Gestion de Pedidos</a>
        <a href="administradorPantalla.jsp">Administrador</a>
    </div>

    <main style="display: flex;justify-content: center;align-items: center;">
        <div class="frameOpc" style="background: #3d3d3d;">
            <h2 class="titulo-contenido">Gestionar</h2>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = '/ecommerce_WEB/UsuarioServlet'"
                    class="btn-gestion">
                    Administrar Usuarios
                </button>
            </div>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = 'gestionarCatalogoProductos.jsp'"
                    class="btn-gestion">
                    Catalogo de Productos
                </button>
            </div>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = 'crearProducto.jsp'"
                    class="btn-gestion">
                    Crear Producto
                </button>
            </div>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = 'editarProducto.jsp'"
                    class="btn-gestion">
                    Editar Producto
                </button>
            </div>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = 'gestionDePedidos.jsp'"
                    class="btn-gestion">
                    Pedidos
                </button>
            </div>
            <div class="grupo-form">
                <button style="background-color: #505077; border: 2px solid #21213b;color: #eae1e3;"
                    onclick="window.location.href = 'gestionarReseñas.jsp'"
                    class="btn-gestion">
                    Reseñas
                </button>
            </div>
        </div>
    </main>

    <footer class="footer">Aplicaciones Web - Unidad 2</footer>
    <script src="javascript/MenuScript.js"></script>
  </body>
</html>
