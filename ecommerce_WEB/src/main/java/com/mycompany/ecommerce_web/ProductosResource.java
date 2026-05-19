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
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;
import java.util.logging.Logger;
import negocio.Producto;
import persistencia.ProductoDAO;

/**
 * REST Web Service
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
@Path("productos")
@RequestScoped
public class ProductosResource {

    @Context
    private UriInfo context;

    private ProductoDAO dao = new ProductoDAO();
    private static final Logger logger = Logger.getLogger(ProductosResource.class.getName());
    /**
     * Creates a new instance of ProductosResource
     */
    public ProductosResource() {
    }

    /**
     * Retrieves representation of an instance of com.mycompany.ecommerce_web.ProductosResource
     * @return an instance of negocio.Producto
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProductos() {
        logger.info("Listando todos los productos del catálogo");
        List<Producto> lista = dao.listarTodos();
        
        if (lista != null && !lista.isEmpty()) {
            return Response.ok(lista).build(); // 200 OK
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                           .entity("{\"mensaje\":\"No hay productos registrados.\"}")
                           .build(); // 404 Not Found
        }
    }
    
    /**
     * 
     * @param id
     * @return 
     */
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProductoPorId(@PathParam("id") int id) {
        logger.info("Buscando producto con ID: " + id);
        Producto p = dao.obtenerPorId(id);
        
        if (p != null) {
            return Response.ok(p).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                           .entity("{\"mensaje\":\"Producto no encontrado\"}")
                           .build();
        }
    }
    
    /**
     * 
     * @param nuevoProducto
     * @return 
     */
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response crearProducto(Producto nuevoProducto) {
        logger.info("Guardando nuevo producto: " + nuevoProducto.getNombre());
        
        // El ID será autogenerado por la BD, así que mandamos 0
        dao.insertar(nuevoProducto);
        
        return Response.status(Response.Status.CREATED)
                       .entity("{\"mensaje\":\"Producto creado exitosamente\"}")
                       .build(); // 201 Created
    }
    
    /**
     * 
     * @param id
     * @param productoActualizado
     * @return 
     */
    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response actualizarProducto(@PathParam("id") int id, Producto productoActualizado) {
        logger.info("Actualizando producto ID: " + id);
        
        // Aseguramos que el producto tenga el ID correcto de la URL antes de mandar al DAO
        productoActualizado.setId(id); 
        dao.actualizar(productoActualizado);
        
        return Response.ok("{\"mensaje\":\"Producto actualizado exitosamente\"}").build();
    }
    
    /**
     * 
     * @param id
     * @return 
     */
    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response eliminarProducto(@PathParam("id") int id) {
        logger.info("Eliminando producto ID: " + id);
        dao.eliminar(id);
        
        return Response.ok("{\"mensaje\":\"Producto eliminado exitosamente\"}").build();
    }
}
