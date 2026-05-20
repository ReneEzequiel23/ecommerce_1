<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Crear Reseña</title>
    <link rel="stylesheet" href="css/PantallaOrigen.css" />
    <link rel="stylesheet" href="css/crearRew.css" />
  </head>
    <body>
        <!-- Registro de usuario -->
        <!-- Edgar Arturo Acevedo Acosta 245769
          Rene Ezequiel Figueroa López 228691 
        -->
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
            <div class="tarjeta-reseña" style="background: #3d3d3d; padding: 30px; width: 40%">
                <h2>Crear Reseña</h2>
                <form action="ResenaServlet" method="POST">
                    <div class="grupo-form">
                        <label for="producto">Producto</label>
                        <label name="producto" id="producto">Nombre del Producto</label>
                        <!-- Traer el id del producto del producto-->
                    </div>
                    <div class="grupo-form">
                        <label for="calificacion">Calificación</label>
                        <input
                            type="number"
                            id="calificacion"
                            name="calificacion"
                            min="1"
                            max="2"
                            step="1"
                            required />
                    </div>
                    <div class="grupo-form">
                        <label for="comentario">Reseña</label>
                    </div>
                    <div class="grupo-form">
                        <textarea id="comentario" name="comentario" required></textarea>
                    </div>
                    <div class="botones-reseña">
                        <button
                            type="button"
                            class="btn-cancelar"
                            onclick="window.location.href = 'catalogoProductos.jsp'">
                            Cancelar
                        </button>
                        <button type="submit" class="btn-crear">confirmar</button>
                    </div>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
    </body>
</html>
