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
import jakarta.servlet.http.HttpSession;
import negocio.Usuario;
import persistencia.UsuarioDAO;

/**
 *
 * @author renee
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        
        // BORRAMOS processRequest(request, response);

        // Recuperar la sesión actual (pasando 'false' para no crear una nueva si no existe)
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Destruir la sesión por completo
            session.invalidate();
        }

        // Redirigir de vuelta al login (Corregido a inicioDeSesion.jsp)
        response.sendRedirect("inicioDeSesion.jsp");
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
        
        // BORRAMOS processRequest(request, response);
        
        // 1. Recibir los parámetros del formulario HTML
        String correo = request.getParameter("correo");
        String password = request.getParameter("contraseña");

        // 2. Instanciar el DAO y buscar al usuario
        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.autenticar(correo, password);

        // 3. Validar si existe el usuario Y si su rol es administrador
        if (usuario != null && "admin".equals(usuario.getRol())) {

            // ¡Login exitoso de administrador! 
            HttpSession session = request.getSession();
            session.setAttribute("adminLogueado", usuario);

            // Redirigimos a la vista principal de administración
            response.sendRedirect("administradorPantalla.jsp");

        } else {
            // Fallo de credenciales
            request.setAttribute("errorLogin", "Credenciales incorrectas o no tienes permisos de administrador.");

            // Reenviamos a la página de login (Corregido a inicioDeSesion.jsp)
            request.getRequestDispatcher("inicioDeSesion.jsp").forward(request, response);
        }
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
