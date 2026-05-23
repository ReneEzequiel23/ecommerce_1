<%-- 
    Document   : catalogoProductos
    Created on : 19 may 2026, 5:36:38 p.m.
    Author     : edgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo Productos</title>
        <link rel="stylesheet" href="css/PantallaOrigen.css" />
        <link rel="stylesheet" href="css/catalogoPr.css" />
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
            <div class="contains">
                <div class="caja-filtros" style="background: #3d3d3d; padding: 30px; width: 40%">
                    <h2>Filtros</h2>
                    <form action="#" method="GET" class="formulario-filtros" id="formFiltros">
                        <div class="fila-filtro">
                            <label for="f-nombre">Nombre</label>
                            <input type="text" id="f-nombre" name="nombre" class="input-texto-nombre" style="padding: 8px"/>
                        </div>

                        <div class="fila-filtro-medio">
                            <label for="check-precio">Precio</label>
                            <input type="checkbox" id="check-precio" class="input-check" />
                            <input
                                type="number"
                                id="f-precio"

                                placeholder="500.00"
                                step="0.01"
                                class="input-texto disabled" style="padding: 8px" />
                        </div>

                        <div class="fila-filtro-inferior">
                            <div class="radios">
                                <label>
                                    Mayor
                                    <input type="radio" name="rango" value="mayor" checked class="input-radio"  />
                                </label>
                                <label
                                    >Menor <input type="radio" name="rango" value="menor" class="input-radio"
                                              /></label>
                            </div>
                            <button type="submit" class="btn-filtrar" style="background-color:#b6d7f7; border: 2px solid #1e1e76; ">Filtrar</button>
                        </div>
                    </form>
                </div>

                <div class="caja-tabla" style="background: #3d3d3d;  ">
                    <form>
                        <table class="tabla-productos">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Detalles del Producto</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="cuerpoCatalogoCliente">
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </main>

        <footer class="footer">Aplicaciones Web - Unidad 2</footer>
        <script src="javascript/MenuScript.js"></script>
        <script src="javascript/catalogoCliente.js"></script>
        <script>
            const checkbox = document.getElementById("check-precio");
            const precio = document.querySelectorAll(".input-texto");

            checkbox.addEventListener("change", function () {
                precio.forEach(div => {
                    if (this.checked) {
                        div.classList.remove("disabled");
                    } else {
                        div.classList.add("disabled");
                    }
                });
            });
        </script>
        <style>
            .disabled{
                display: none;
            }

        </style>
    </body>
</html>
