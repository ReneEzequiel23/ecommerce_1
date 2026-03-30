/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
import negocio.Pedido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utilidades.ConexionBD;
public class PedidosDAO {
    
    public List<Pedido> listarTodos(){
        List<Pedido> listaPedidods= new ArrayList<>();
        String sql= "SELECT * FROM Pedido"; 
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Pedido p = new Pedido(
                        rs.getInt("id"),
                        rs.getDate("fecha"),
                        rs.getString("estado"),
                        rs.getDouble("total"),
                        rs.getInt("usuario_id"),
                        rs.getInt("direccion_id")
                );

                listaPedidods.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los productos: " + e.getMessage());
        }
        return listaPedidods;
    }
    
    public Pedido obtenerPorId(int id){
        Pedido p=null;
        String sql = "SELECT * FROM Pedido WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Pedido(rs.getInt("id"), rs.getDate("fecha"),
                            rs.getString("estado"), rs.getDouble("total"),
                            rs.getInt("usuario_id"), rs.getInt("direccion_id"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener pedido: " + e.getMessage());
        }
        return p;
    }
    
    public void agregarPedido(Pedido p){
        String sql = "INSERT INTO Pedido (fecha, estado, total, usuario_id, direccion_id) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setDate(1, p.getFecha());
            ps.setString(2, p.getEstado());
            ps.setDouble(3, p.getTotal());
            ps.setInt(4, p.getUsuario_id());
            ps.setInt(5, p.getDireccion_id());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Pedido agregado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al agregar el pedido: " + e.getMessage());
        }
    }
    
    public void actualizar(Pedido p){
        String sql = "UPDATE Producto SET nombre=?, descripcion=?, precio=?, existencia=?, categoria_id=? WHERE id=?";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDate(1, p.getFecha());
            ps.setString(2, p.getEstado());
            ps.setDouble(3, p.getTotal());
            ps.setInt(4, p.getUsuario_id());
            ps.setInt(5, p.getDireccion_id());
            ps.setInt(6, p.getId()); // El ID va al final para la cláusula WHERE

            ps.executeUpdate();
            System.out.println("Pedido actualizado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al actualizar el pedido: " + e.getMessage());
        }
    }
}
