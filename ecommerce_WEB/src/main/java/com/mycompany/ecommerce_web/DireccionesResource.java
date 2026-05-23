/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/WebServices/GenericResource.java to edit this template
 */
package com.mycompany.ecommerce_web;

import jakarta.enterprise.context.RequestScoped;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Context;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.core.UriInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import negocio.Direccion;
import utilidades.ConexionBD;

/**
 * REST Web Service
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
@Path("direcciones")
@RequestScoped
public class DireccionesResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of DireccionesResource
     */
    public DireccionesResource() {
    }

@GET
    @Path("/usuario/{usuarioId}")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Direccion> getDireccionesPorUsuario(@PathParam("usuarioId") int usuarioId) {
        List<Direccion> lista = new ArrayList<>();
        // Consulta exacta basada en tu tabla (id, calle, ciudad, estado, codigo_postal, usuario_id)
        String sql = "SELECT id, calle, ciudad, estado, codigo_postal, usuario_id FROM Direccion WHERE usuario_id = ?";
        
        try (Connection con = ConexionBD.getConexion(); 
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, usuarioId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Usamos el constructor que tienes en Direccion.java
                    lista.add(new Direccion(
                        rs.getInt("id"), 
                        rs.getString("calle"), 
                        rs.getString("ciudad"), 
                        rs.getString("estado"), 
                        rs.getString("codigo_postal"), 
                        rs.getInt("usuario_id")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Esto imprimirá el error real en la consola de NetBeans
        }
        return lista;
    }

}
