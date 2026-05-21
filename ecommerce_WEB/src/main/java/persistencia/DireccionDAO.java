/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import negocio.Direccion;
import utilidades.ConexionBD;

/**
 *
 * @author edgar
 */
public class DireccionDAO {
    public void eliminar(int id) {
        String sql = "DELETE FROM Direccion WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        }
    }
    
    public List<Direccion> listarTodos() {
        List<Direccion> listaDireccion = new ArrayList<>();
        String sql = "SELECT * FROM Direccion";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Direccion p = new Direccion(
                        rs.getInt("id"),
                        rs.getString("calle"),
                        rs.getString("ciudad"),
                        rs.getString("estado"),
                        rs.getString("codigo"),
                        rs.getInt("rol")
                );

                listaDireccion.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los Direccion: " + e.getMessage());
        }

        return listaDireccion;
    }

    // Método para OBTENER un Direccion por su id
    public Direccion obtenerPorId(int id) {
        Direccion p = null;
        String sql = "SELECT * FROM Direccion WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Direccion(rs.getInt("id"),
                            rs.getString("calle"),
                            rs.getString("ciudad"),
                            rs.getString("estado"),
                            rs.getString("codigo"),
                            rs.getInt("id")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener Direccion: " + e.getMessage());
        }
        return p;
    }

    // Método para INSERTAR un nuevo Direccion
    public void insertar(Direccion p) {
        String sql = "INSERT INTO Direccion (calle, ciudad, estado, codigo, Usuario_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getCalle());
            ps.setString(2, p.getCiudad());
            ps.setString(3, p.getEstado());
            ps.setString(4, p.getCodigo());
            ps.setInt(5, p.getIdUsuario());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Direccion insertado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al insertar el Direccion: " + e.getMessage());
        }
    }

    // Método para ACTUALIZAR un usuario existente
    public void actualizar(Direccion p) {
        String sql = "UPDATE Direccion SET calle=?, ciudad=?,estado=?,codigo=?,usuario_id=? WHERE id=?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getCalle());
            ps.setString(2, p.getCiudad());
            ps.setString(3, p.getEstado());
            ps.setString(4, p.getCodigo());
            ps.setInt(5, p.getIdUsuario());
            ps.setInt(6, p.getId()); // El ID va al final para la cláusula WHERE

            ps.executeUpdate();
            System.out.println("Direccion actualizado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al actualizar el Direccion: " + e.getMessage());
        }
    }
}
