/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package com.mycompany.ecommerce_web;

import static com.mysql.cj.conf.PropertyKey.logger;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.UriInfo;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.enterprise.context.RequestScoped;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.logging.Logger;
import negocio.SolicitudPedido;
import negocio.Usuario;
import persistencia.PedidoDAO;

/**
 * REST Web Service
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
@Path("pedidos")
@RequestScoped
public class PedidosResource {

    @Context
    private UriInfo context;

    @Context
    private HttpServletRequest request;

    private static final Logger logger = Logger.getLogger(PedidosResource.class.getName());
    private PedidoDAO dao = new PedidoDAO();

    /**
     * Creates a new instance of PedidosResource
     */
    public PedidosResource() {
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response procesarPedido(SolicitudPedido solicitud) {
        logger.info("Recibiendo petición de compra con método: " + solicitud.getMetodoPago());

        if (solicitud.getDetalles() == null || solicitud.getDetalles().isEmpty()) {
            return Response.status(Response.Status.BAD_REQUEST)
                    .entity("{\"mensaje\":\"El carrito está vacío.\"}")
                    .build();
        }

        HttpSession sesion = request.getSession();
        Usuario usuarioActivo = (Usuario) sesion.getAttribute("clienteLogueado");

        if (usuarioActivo != null) {
            // Le asignamos el ID REAL del cliente al pedido
            solicitud.setUsuarioId(usuarioActivo.getId());
        } else {
            // Si intenta comprar sin iniciar sesión, lo bloqueamos
            return Response.status(Response.Status.UNAUTHORIZED)
                    .entity("{\"mensaje\":\"Debes iniciar sesión para procesar un pedido.\"}")
                    .build();
        }

        boolean exito = dao.registrarCompraSegura(solicitud);

        if (exito) {
            return Response.status(Response.Status.CREATED)
                    .entity("{\"mensaje\":\"Pedido generado exitosamente y guardado en MySQL.\"}")
                    .build();
        } else {
            return Response.status(Response.Status.INTERNAL_SERVER_ERROR)
                    .entity("{\"mensaje\":\"Hubo un error interno al procesar el pago y guardar el pedido.\"}")
                    .build();
        }
    }
}
