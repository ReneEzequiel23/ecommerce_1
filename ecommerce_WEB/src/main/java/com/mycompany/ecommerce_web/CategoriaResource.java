/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce_web;

import jakarta.enterprise.context.RequestScoped;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriInfo;
import java.util.List;
import java.util.logging.Logger;
import negocio.Categoria;
import persistencia.CategoriaDAO;

/**
 *
 * @author edgar
 */
@Path("categorias")
@RequestScoped
public class CategoriaResource {
    @Context
    private UriInfo context;

    private CategoriaDAO dao = new CategoriaDAO();
    private static final Logger logger = Logger.getLogger(ProductosResource.class.getName());

    public CategoriaResource() {
    }
    
    /**
     * Retrieves representation of an instance of com.mycompany.ecommerce_web.CategoriaResource
     *
     * @return an instance of negocio.Catalogo
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getCategorias() {
        logger.info("Listando todos los Catalogos ");
        List<Categoria> lista = dao.listarTodos();

        if (lista != null && !lista.isEmpty()) {
            return Response.ok(lista).build(); // 200 OK
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("{\"mensaje\":\"No hay categorias registradas.\"}")
                    .build(); // 404 Not Found
        }
    }
}
