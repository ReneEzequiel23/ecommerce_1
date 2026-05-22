/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package com.mycompany.ecommerce_web;

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
import negocio.Producto;
import negocio.Resena;
import negocio.Usuario;
import persistencia.ProductoDAO;
import persistencia.ResenaDao;
import persistencia.UsuarioDAO;

/**
 * REST Web Service
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
@Path("resenas")
@RequestScoped
public class ResenasResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of ResenasResource
     */
    public ResenasResource() {
    }

    @GET
    @Path("/{id}/detalles")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getDetallesResena(@PathParam("id") int id) {
        
        ResenaDao dao = new ResenaDao();
        Resena r = dao.obtenerPorId(id);
        
        if (r == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        // Instancia DTO
        Resena miDto = new Resena(); 
        miDto.setCalificacion(r.getCalificacion());
        miDto.setComentario(r.getComentario());

        // Busca los nombres y completamos DTO
        try {
            Usuario u = new UsuarioDAO().obtenerPorId(r.getUsuario_id());
            miDto.setNombreUsuario(u != null ? u.getNombre() : "Usuario Desconocido");

            Producto p = new ProductoDAO().obtenerPorId(r.getProducto_id());
            miDto.setNombreProducto(p != null ? p.getNombre() : "Producto Desconocido");
        } catch (Exception e) {
            miDto.setNombreUsuario("ID: " + r.getUsuario_id());
            miDto.setNombreProducto("ID: " + r.getProducto_id());
        }

        // JAX-RS convierte DTO a JSON
        return Response.ok(miDto).build();
    }
}
