<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrador</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/administrador.css" />
  </head>
  <body>
    <!-- Pantalla administrador -->
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
                  <li><a href="perfilUsuario.html">Perfil</a></li>
                  <li><a href="inicioDeSesion.html">Cerrar SesiÃ³n</a></li>
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
              <a href="catalogoProductos.jsp">Catalogo de Productos</a>
            </li>
            <li class="page"><a href="carritoCompras.html">Carrito de Compras</a></li>
            <li class="page">
              <a href="gestionDePedidos.jsp">Gestión de Pedidos</a>
            </li>
            <li class="page">
              <a href="administradorPantalla.jsp" style="background-color: #999"
                >Administrador</a>
            </li>
            <li class="page"><a href="inicioDeSesion.jsp">Iniciar SesiÃ³n</a></li>
          </ul>
        </div>
      </div>

      <div id="containerPg" class="contenido">
        <div class="frameOpc">
          <h2 class="titulo-contenido">Gestionar</h2>
          <div class="grupo-form">
            <button
              onclick="window.location.href = '/ecommerce_WEB/UsuarioServlet'"
              class="btn-gestion">
              Administrar Usuarios
            </button>
          </div>
          <div class="grupo-form">
            <button
              onclick="window.location.href = '/ecommerce_WEB/ProductoServlet'"
              class="btn-gestion">
              Catalogo de Productos
            </button>
          </div>
          <div class="grupo-form">
            <button
              onclick="window.location.href = 'crearProducto.jsp'"
              class="btn-gestion">
              Crear Producto
            </button>
          </div>
          <div class="grupo-form">
            <button
              onclick="window.location.href = 'editarProducto.jsp'"
              class="btn-gestion">
              Editar Producto
            </button>
          </div>
          <div class="grupo-form">
            <button
              onclick="window.location.href = 'gestionDePedidos.jsp'"
              class="btn-gestion">
              Pedidos
            </button>
          </div>
          <div class="grupo-form">
            <button
              onclick="window.location.href = 'gestionarReseñas.jsp'"
              class="btn-gestion">
              Reseñas
            </button>
          </div>
        </div>
      </div>

      <div id="containerPg" class="piePagina">
        <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
      </div>
    </div>
  </body>
</html>
