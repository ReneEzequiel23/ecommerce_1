/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package utilidades;

import java.sql.Connection;
import java.util.List;
import negocio.Categoria;
import negocio.Resena;
import negocio.Usuario;
import persistencia.CategoriaDAO;
import persistencia.ResenaDao;
import persistencia.UsuarioDAO;

/**
 *
 * @author renee
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
    Connection con = utilidades.ConexionBD.getConexion();
    if (con != null) {
        System.out.println("Todo listo para empezar con los DAOs y BOs.");
        ResenaDao da=new ResenaDao();
        
        System.out.println(da.listarTodos());
        List<Resena> list= da.listarTodos();
        UsuarioDAO user=new UsuarioDAO();
        
        for(Resena u:list){
            Usuario us= user.obtenerPorId(u.getUsuario_id());
            System.out.println(us.getNombre());
            System.out.println(u.getCalificacion());
            System.out.println(u.getId());
        }
    }
    
}
    
}
