package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import negocio.Usuario;
import utilidades.ConexionBD;

/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
public class UsuarioDAO {

    // Método para autenticar exclusivamente a los administradores
    public Usuario autenticar(String correo, String contrasena) {
        Usuario admin = null;
        String sql = "SELECT * FROM Usuario WHERE correo = ? AND contraseña = ?";

        try (Connection con = ConexionBD.getConexion();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, correo);
            ps.setString(2, contrasena);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new Usuario();
                    admin.setId(rs.getInt("id"));
                    admin.setNombre(rs.getString("nombre"));
                    admin.setCorreo(rs.getString("correo"));
                    admin.setContrasena(rs.getString("contraseña"));
                    admin.setTelefono(rs.getString("telefono"));
                    admin.setRol(rs.getString("rol"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al autenticar administrador: " + e.getMessage());
        }
        
        return admin; 
    }
    
    public List<Usuario> listarTodos() {
        List<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT * FROM Usuario";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Usuario p = new Usuario(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("correo"),
                        rs.getString("contraseña"),
                        rs.getString("telefono"),
                        rs.getString("rol"),
                        rs.getBoolean("activo")
                );

                listaUsuarios.add(p);
            }
        } catch (SQLException e) {
            System.out.println("Error al listar los Usuarios: " + e.getMessage());
        }

        return listaUsuarios;
    }
    
    // Método para ELIMINAR un Usuario
    public void eliminar(int id) {
        String sql = "DELETE FROM Usuario WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar: " + e.getMessage());
        }
    }

    // Método para OBTENER un Usuario por su id
    public Usuario obtenerPorId(int id) {
        Usuario p = null;
        String sql = "SELECT * FROM Usuario WHERE id = ?";
        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    p = new Usuario(rs.getInt("id"),
                            rs.getString("nombre"),
                            rs.getString("correo"),
                            rs.getString("contraseña"),
                            rs.getString("telefono"),
                            rs.getString("rol"),
                            rs.getBoolean("activo")
                    );
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener Usuario: " + e.getMessage());
        }
        return p;
    }

    // Método para INSERTAR un nuevo producto
    public void insertar(Usuario p) {
        String sql = "INSERT INTO Usuario (nombre, correo, contraseña, telefono, rol) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getCorreo());
            ps.setString(3, p.getContrasena());
            ps.setString(4, p.getTelefono());
            ps.setString(5, p.getRol());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Usuario insertado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al insertar el Usuario: " + e.getMessage());
        }
    }
    
    public void insertarRegistro(Usuario p) {
        String sql = "INSERT INTO Usuario (nombre, correo, contraseña, telefono) VALUES (?, ?, ?, ?)";

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            // Llenamos los signos de interrogación con los datos del objeto
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getCorreo());
            ps.setString(3, p.getContrasena());
            ps.setString(4, p.getTelefono());

            ps.executeUpdate(); // Ejecutamos la inserción
            System.out.println("Usuario insertado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al insertar el Usuario: " + e.getMessage());
        }
    }

    // Método para ACTUALIZAR un usuario existente
    public void actualizar(Usuario p) {
        String sql = "UPDATE Usuario SET nombre=?, correo=?,contraseña=?,telefono=?,rol=?,activo=? WHERE id=?";
        boolean act=true;
        if (p.isActivo() == true) {
            act = false;
            p.setActivo(act);
        }

        try (Connection con = ConexionBD.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getCorreo());
            ps.setString(3, p.getContrasena());
            ps.setString(4, p.getTelefono());
            ps.setString(5, p.getRol());
            ps.setBoolean(6, p.isActivo());
            ps.setInt(7, p.getId()); // El ID va al final para la cláusula WHERE

            ps.executeUpdate();
            System.out.println("Usuario actualizado correctamente.");

        } catch (SQLException e) {
            System.out.println("Error al actualizar el Usuario: " + e.getMessage());
        }
    }
}