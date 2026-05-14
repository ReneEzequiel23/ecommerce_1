/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
import negocio.Resena;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilidades.ConexionBD;

public class ResenaDao {
    
    public List<Resena> listarTodos(){
        List<Resena> listaResenas = new ArrayList<>();
        String sql = "SELECT * FROM Resena";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Resena r = new Resena(
                        rs.getInt("id"),
                        rs.getInt("calificacion"),
                        rs.getString("comentario"),
                        rs.getDate("fecha"),
                        rs.getInt("usuario_id"),
                        rs.getInt("producto_id")
                );

                listaResenas.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar las Reseñas: " + e.getMessage());
        }

        return listaResenas;
    }
    
    public void crearResena(Resena p){
        String sql = "INSERT INTO Resena (calificacion, comentario, usuario_id, producto_id) VALUES (?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setInt(1, p.getCalificacion());
            ps.setString(2, p.getComentario());
            ps.setInt(3, p.getUsuario_id());
            ps.setInt(4, p.getProducto_id());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Reseña insertado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al crear la reseña: " + e.getMessage());
        }
    }
    
    public void eliminar(int id){
        String sql = "DELETE FROM Resena WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        }
    }
    
    public Resena obtenerPorId(int id) {
        Resena p = null;
        String sql = "SELECT * FROM Resena WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Resena(rs.getInt("id"), rs.getInt("calificacion"),
                        rs.getString("comentario"), rs.getDate("fecha"),
                        rs.getInt("usuario_id"), rs.getInt("producto_id"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener Reseña: " + e.getMessage());
        }
        return p;
    }
}
