/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
/**
 *
 * @author renee
 */
public class ConexionBD {
    
    // Cambia estos valores si tu usuario o contraseña
    private static final String URL = "jdbc:mysql://localhost:3306/ecommerce_admin?useSSL=false&serverTimezone=UTC";
    private static final String USUARIO = "root"; 
    private static final String PASSWORD = "2602"; 

    public static Connection getConexion() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("Conexión exitosa");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Fallo la conexión a la base de datos.");
            e.printStackTrace();
        }
        return conexion;
    }
}
