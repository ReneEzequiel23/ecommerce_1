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
import negocio.Usuario;
import persistencia.UsuarioDAO;

/**
 *
 * @author edgar
 */
@WebServlet(name = "AdministrarUsuarioServlet", urlPatterns = {"/AdministrarUsuarioServlet"})
public class AdministrarUsuarioServlet extends HttpServlet {
    UsuarioDAO dao = new UsuarioDAO();
   

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
        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty() || accion.equals("listar")) {
            List<Usuario> lista = dao.listarTodos();
            request.setAttribute("listaUsuarios", lista);

        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            response.sendRedirect("AdministrarUsuarioServlet?accion=listar");
        } else if (accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));

            //Buscar ese usuario en la BD
            Usuario usuarioAEditar = dao.obtenerPorId(id);
            dao.actualizar(usuarioAEditar);;
            response.sendRedirect("AdministrarUsuarioServlet?accion=listar");
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
