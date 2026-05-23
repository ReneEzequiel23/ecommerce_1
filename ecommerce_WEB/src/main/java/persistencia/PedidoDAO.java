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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import negocio.ProductoCarrito;
import negocio.SolicitudPedido;
import utilidades.ConexionBD;
public class PedidoDAO {
    
    public List<Pedido> listarTodos(){
        List<Pedido> listaPedidodos= new ArrayList<>();
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

                listaPedidodos.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los pedidos: " + e.getMessage());
        }
        return listaPedidodos;
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
        String sql = "INSERT INTO Pedido ( estado, total, usuario_id, direccion_id) VALUES ( ?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getEstado());
            ps.setDouble(2, p.getTotal());
            ps.setInt(3, p.getUsuario_id());
            ps.setInt(4, p.getDireccion_id());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Pedido agregado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al agregar el pedido: " + e.getMessage());
        }
    }
    
    public void actualizar(Pedido p){
        String sql = "UPDATE Pedido SET  estado=?, total=?, usuario_id=?, direccion_id=? WHERE id=?";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getEstado());
            ps.setDouble(2, p.getTotal());
            ps.setInt(3, p.getUsuario_id());
            ps.setInt(4, p.getDireccion_id());
            ps.setInt(5, p.getId()); // El ID va al final para la cláusula WHERE

            ps.executeUpdate();
            System.out.println("Pedido actualizado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al actualizar el pedido: " + e.getMessage());
        }
    }
    
    public boolean registrarCompraSegura(SolicitudPedido solicitud) {
        Connection con = null;
        
        try {
            con = ConexionBD.getConexion();
            con.setAutoCommit(false); 

            double totalCalculado = 0;

           //calcular el total real consultando los precios actuales de la base de datos
            String sqlPrecio = "SELECT precio FROM Producto WHERE id = ?";
            try (PreparedStatement psPrecio = con.prepareStatement(sqlPrecio)) {
                for (ProductoCarrito item : solicitud.getDetalles()) {
                    psPrecio.setInt(1, item.getId());
                    try (ResultSet rs = psPrecio.executeQuery()) {
                        if (rs.next()) {
                            totalCalculado += (rs.getDouble("precio") * item.getCantidad());
                        } else {
                            throw new SQLException("Producto con ID " + item.getId() + " no existe.");
                        }
                    }
                }
            }

            //Simulando Usuario 2)
            int pedidoIdGenerado = 0;
            String sqlPedido = "INSERT INTO Pedido (estado, total, usuario_id, direccion_id) VALUES ('Pendiente', ?, ?, ?)";
            
            try (PreparedStatement psPedido = con.prepareStatement(sqlPedido, Statement.RETURN_GENERATED_KEYS)) {
                psPedido.setDouble(1, totalCalculado);
                psPedido.setInt(2, solicitud.getUsuarioId());
                psPedido.setInt(3, solicitud.getDireccionId());
                psPedido.executeUpdate();
                
                // Recuperamos el ID autoincrementable que MySQL le asignó al pedido
                try (ResultSet rsKeys = psPedido.getGeneratedKeys()) {
                    if (rsKeys.next()) {
                        pedidoIdGenerado = rsKeys.getInt(1);
                    } else {
                        throw new SQLException("Fallo al obtener el ID del Pedido.");
                    }
                }
            }

            // restar el Stock en Producto
            String sqlDetalle = "INSERT INTO detalle_Pedido (cantidad, precio_unidad, pedido_id, producto_id) VALUES (?, ?, ?, ?)";
            String sqlStock = "UPDATE Producto SET existencia = existencia - ? WHERE id = ?";
            
            try (PreparedStatement psDetalle = con.prepareStatement(sqlDetalle);
                 PreparedStatement psStock = con.prepareStatement(sqlStock);
                 PreparedStatement psPrecio = con.prepareStatement(sqlPrecio)) {
                 
                for (ProductoCarrito item : solicitud.getDetalles()) {
                    // Volvemos a consultar el precio real para el detalle
                    double precioUnidad = 0;
                    psPrecio.setInt(1, item.getId());
                    try (ResultSet rs = psPrecio.executeQuery()) {
                        if (rs.next()) precioUnidad = rs.getDouble("precio");
                    }
                    
                    // Guardar detalle
                    psDetalle.setInt(1, item.getCantidad());
                    psDetalle.setDouble(2, precioUnidad);
                    psDetalle.setInt(3, pedidoIdGenerado);
                    psDetalle.setInt(4, item.getId());
                    psDetalle.executeUpdate();
                    
                    // Restar inventario
                    psStock.setInt(1, item.getCantidad());
                    psStock.setInt(2, item.getId());
                    psStock.executeUpdate();
                }
            }

            // insertar el recibo en la tabla Pago
            String sqlPago = "INSERT INTO Pago (monto, estado, pedido_id) VALUES (?, 'Completado', ?)";
            try (PreparedStatement psPago = con.prepareStatement(sqlPago)) {
                psPago.setDouble(1, totalCalculado);
                psPago.setInt(2, pedidoIdGenerado);
                psPago.executeUpdate();
            }
            con.commit();
            return true;

        } catch (SQLException ex) {
            // Si cualquier paso falla, cancelamos todos los cambios (ROLLBACK)
            try {
                if (con != null) {
                    System.err.println("Ejecutando Rollback de la transacción debido a un error...");
                    con.rollback();
                }
            } catch (SQLException re) {
                System.err.println("Error grave al intentar hacer rollback: " + re.getMessage());
            }
            ex.printStackTrace();
            return false;
        } finally {
            // Restauramos el comportamiento normal de la conexión
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
