<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Crear Reseña</title>
    <link rel="stylesheet" href="css/styles.css" />
    <link rel="stylesheet" href="css/crearRew.css" />
  </head>
    <body>
        <!-- Registro de usuario -->
        <!-- Edgar Arturo Acevedo Acosta 245769
          Rene Ezequiel Figueroa López 228691 
        -->
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


            <div id="containerPg" class="contenido">
              <div class="tarjeta-reseña">
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
                      onclick="window.location.href = 'catalogoProductos.html'">
                      Cancelar
                    </button>
                    <button type="submit" class="btn-crear">confirmar</button>
                  </div>
                </form>
              </div>
            </div>

            <div id="containerPg" class="piePagina">
                <h3 class="materia">Aplicaciones Web - Unidad 2</h3>
            </div>
        </div>
    </body>
</html>
