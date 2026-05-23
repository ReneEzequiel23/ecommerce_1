/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Logger;
import negocio.Usuario;
import persistencia.UsuarioDAO;

/**
 *
 * @author edgar
 */
@Path("usuarios")
@RequestScoped
public class UsuarioResource {
    @Context
    private UriInfo context;
    
    private UsuarioDAO dao = new UsuarioDAO();
    private static final Logger logger = Logger.getLogger(UsuarioResource.class.getName());

    public UsuarioResource() {
    }
    

    /**
     *
     * @param id
     * @return
     */
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getUsuarioPorId(@PathParam("id") int id) {
        logger.info("Buscando Usuario con ID: " + id);
        Usuario p = dao.obtenerPorId(id);

        if (p != null) {
            return Response.ok(p).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("{\"mensaje\":\"Usuario no encontrado\"}")
                    .build();
        }
    }
    
    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response actualizarUsuario(@PathParam("id") int id, Usuario UsuarioActualizado) {
        logger.info("Actualizando usuario ID: " + id);

        // Aseguramos que el producto tenga el ID correcto de la URL antes de mandar al DAO
        UsuarioActualizado.setId(id);
        dao.actualizarRolActivo(UsuarioActualizado);

        return Response.ok("{\"mensaje\":\"Usuario actualizado exitosamente\"}").build();
    }
   
}
