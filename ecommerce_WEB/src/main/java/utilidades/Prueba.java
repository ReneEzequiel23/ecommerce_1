/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package utilidades;

import java.sql.Connection;
import java.util.List;
import negocio.Categoria;
import negocio.Usuario;
import persistencia.CategoriaDAO;
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
        CategoriaDAO da=new CategoriaDAO();
        System.out.println(da.listarTodos());
        List<Categoria> list= da.listarTodos();
        Usuario us;
        for(Categoria u:list){
            System.out.println(u.getNombre());
            System.out.println(u.getId());
        }
    }
    
}
    
}
