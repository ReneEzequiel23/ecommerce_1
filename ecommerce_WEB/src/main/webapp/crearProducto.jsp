<%@page import="java.util.List"%>
<%@page import="negocio.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Crear Producto</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/adminProducto.css" />
    </head>
    <body>
        <!-- Pagina Principal -->
        <!-- Edgar Arturo Acevedo Acosta 245769
              Rene Ezequiel Figueroa LÃ³pez 228691 -->
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
            <div class="tarjeta-producto" style="background: #3d3d3d; padding: 30px; width: 600px">
                <h2>Crear Nuevo Libro</h2>

                <form id="formularioCrear" action="#" method="POST">
                    <div class="grupo-form">
                        <label for="nombre">Título del Libro</label>
                        <input type="text" id="nombre" name="nombre" required style="padding: 8px"/>
                    </div>

                    <div class="grupo-form">
                        <label for="descripcion">Descripción / Autor</label>
                        <textarea name="descripcion" id="descripcion" required></textarea>
                    </div>

                    <div class="grupo-form">
                        <label for="precio">Precio ($)</label>
                        <input type="number" id="precio" name="precio" step="0.01" required style="padding: 8px"/>
                    </div>

                    <div class="grupo-form">
                        <label for="cantidad">Cantidad en Stock</label>
                        <input type="number" id="cantidad" name="cantidad" min="0" required style="padding: 8px"/>
                    </div>

                    <div class="grupo-form">
                        <label for="categoria">Categoría</label>
                        <select name="categoria" id="categoria" required style="width: 100%; padding: 8px">
                            <option value="">Cargando categorías...</option>
                        </select>
                    </div>

                    <button type="submit" class="btn-crear" style="left: 25%;width: 20%;">Crear Libro</button>
                    <button
                        type="button"
                        class="btn-crear"
                        style="left: 25%; width: 20%; background-color:#c92c3c; margin-top: 10px; border: 2px solid #2e0003;"
                        onclick="window.location.href = 'gestionarCatalogoProductos.jsp'">
                        Cancelar
                    </button>
                </form>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/crearProducto.js"></script>
    </body>
</html>