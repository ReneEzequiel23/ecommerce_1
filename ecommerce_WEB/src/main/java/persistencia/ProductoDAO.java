/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

/**
 *
 * @author renee
 */

import negocio.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilidades.ConexionBD;
public class ProductoDAO {
    public List<Producto> listarTodos() {
        List<Producto> listaProductos = new ArrayList<>();
        String sql = "SELECT * FROM Producto";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Recorremos cada fila que nos devuelve MySQL
            while (rs.next()) {
                Producto p = new Producto(
                    rs.getInt("id"),
                    rs.getString("nombre"),
                    rs.getString("descripcion"),
                    rs.getDouble("precio"),
                    rs.getInt("existencia"),
                    rs.getInt("categoria_id")
                );
                // Agregamos el producto a nuestra lista
                listaProductos.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los productos: " + e.getMessage());
        }

        return listaProductos;
    }
    
    // Método para ELIMINAR un producto
    public void eliminar(int id) {
        String sql = "DELETE FROM Producto WHERE id = ?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        }
    }

    // Método para OBTENER un producto por su ID (Útil para llenar el formulario de Editar)
    public Producto obtenerPorId(int id) {
        Producto p = null;
        String sql = "SELECT * FROM Producto WHERE id = ?";
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Producto(rs.getInt("id"), rs.getString("nombre"), 
                            rs.getString("descripcion"), rs.getDouble("precio"), 
                            rs.getInt("existencia"), rs.getInt("categoria_id"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener producto: " + e.getMessage());
        }
        return p;
    }
    // Método para INSERTAR un nuevo producto
    public void insertar(Producto p) {
        String sql = "INSERT INTO Producto (nombre, descripcion, precio, existencia, categoria_id) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getDescripcion());
            ps.setDouble(3, p.getPrecio());
            ps.setInt(4, p.getExistencia()); 
            ps.setInt(5, p.getCategoriaId());
            
            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Libro insertado correctamente.");
            
        } catch (SQLException e) {
            System.out.println("Error al insertar el libro: " + e.getMessage());
        }
    }
}
