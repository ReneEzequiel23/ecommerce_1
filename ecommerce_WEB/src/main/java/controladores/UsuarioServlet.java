/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import negocio.Producto;
import negocio.Usuario;
import persistencia.UsuarioDAO;

/**
 *
 * @author edgar
 */
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {
    UsuarioDAO dao=new UsuarioDAO();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos la acción de la URL
        String accion = request.getParameter("accion");
        
        if (accion == null || accion.isEmpty() || accion.equals("listar")) {
            List<Usuario> lista = dao.listarTodos();
            request.setAttribute("listaUsuariosaDMIN", lista);
            request.getRequestDispatcher("administrarUsuarios.jsp").forward(request, response);

        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            response.sendRedirect("UsuarioServlet?accion=listar");
        } else if (accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));

            //Buscar ese usuario en la BD
            Usuario usuarioAEditar = dao.obtenerPorId(id);
            dao.actualizar(usuarioAEditar);;
            response.sendRedirect("UsuarioServlet?accion=listar");
            //Mandar el usuario a la vista
            
//            request.setAttribute("usuario", usuarioAEditar);
////            response.sendRedirect("UsuarioServlet?accion=listar");
//            request.getRequestDispatcher("administrarUsuarios.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Obtenemos una acción secreta que enviaremos desde el formulario de editar
        String accion = request.getParameter("accion");

        String nombre = request.getParameter("nombre");
        String Correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String telefono = request.getParameter("telefono");
        String rol= request.getParameter("rol");
        boolean activo= Boolean.parseBoolean(request.getParameter("activo"));

        if ("actualizar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario usuarioEditado = new Usuario(id, nombre, Correo, contrasena, telefono, rol,activo);
            dao.actualizar(usuarioEditado);
        } else {
            // Si no hay acción de actualizar, significa que viene de "crearProducto.jsp"
            Usuario nuevoUsuario = new Usuario(0, nombre, Correo, contrasena, telefono);
            dao.insertar(nuevoUsuario);
        }

        // Redirigimos de vuelta al catálogo
        response.sendRedirect("gestionarCatalogoProductos.jsp");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
