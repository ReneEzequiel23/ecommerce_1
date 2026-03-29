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
    
    // Cambia estos valores si tu usuario o contraseña de MySQL son diferentes
    private static final String URL = "jdbc:mysql://localhost:3306/ecommerce_admin?useSSL=false&serverTimezone=UTC";
    private static final String USUARIO = "root"; 
    private static final String PASSWORD = "1234"; 

    // Método estático para obtener la conexión
    public static Connection getConexion() {
        Connection conexion = null;
        try {
            // 1. Cargar el Driver de MySQL (necesario en aplicaciones web)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Establecer la conexión
            conexion = DriverManager.getConnection(URL, USUARIO, PASSWORD);
            System.out.println("¡Conexión exitosa a la base de datos!");
            
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el driver de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Fallo la conexión a la base de datos.");
            e.printStackTrace();
        }
        return conexion;
    }
}
