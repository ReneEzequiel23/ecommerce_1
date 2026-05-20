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
import negocio.Categoria;
import utilidades.ConexionBD;

/**
 *
 * @author edgar
 */
public class CategoriaDAO {
    public List<Categoria> listarTodos() {
        List<Categoria> listaCategorias = new ArrayList<>();
        String sql = "SELECT * FROM Categoria";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Categoria p = new Categoria(
                        rs.getInt("id"),
                        rs.getString("nombre")
                );
                listaCategorias.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los productos: " + e.getMessage());
        }
        return listaCategorias;
    }

    // Método para ELIMINAR un categoria
    public void eliminar(int id) {
        String sql = "DELETE FROM Categoria WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        }
    }

    // Método para OBTENER un categoria por su id
    public Categoria obtenerPorId(int id) {
        Categoria p = null;
        String sql = "SELECT * FROM Categoria WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Categoria(rs.getInt("id"), rs.getString("nombre"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener la categoria: " + e.getMessage());
        }
        return p;
    }

    // Método para INSERTAR una nueva categoria
    public void insertar(Categoria p) {
        String sql = "INSERT INTO Categoria (nombre) VALUES (?)";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getNombre());
            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Categoria insertado correctamente.");
        } catch (SQLException e) {
            System.out.println("Error al insertar la categoria: " + e.getMessage());
        }
    }
}
