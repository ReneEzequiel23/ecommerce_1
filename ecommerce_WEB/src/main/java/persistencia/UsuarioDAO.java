package persistencia;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;
import utilidades.ConexionBD;

public class UsuarioDAO {

    // Método para autenticar exclusivamente a los administradores
    public Usuario autenticar(String correo, String contrasena) {
        Usuario admin = null;
        // La consulta exige que el rol sea 'admin'
        String sql = "SELECT * FROM Usuario WHERE correo = ? AND contraseña = ? AND rol = 'admin'";

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
        
        // Si las credenciales son correctas y es admin, retorna el objeto; si no, retorna null
        return admin; 
    }
}