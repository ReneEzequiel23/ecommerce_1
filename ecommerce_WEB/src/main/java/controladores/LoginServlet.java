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
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
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
        
        
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Destruir la sesión
            session.invalidate();
        }

        // Redirigir de vuelta al login
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
        
        String correo = request.getParameter("correo");
        String password = request.getParameter("contraseña");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.autenticar(correo, password);

        if (usuario != null && "admin".equals(usuario.getRol())) {

            HttpSession session = request.getSession();
            session.setAttribute("adminLogueado", usuario);

            response.sendRedirect("administradorPantalla.jsp");

        } else if(usuario != null && "cliente".equals(usuario.getRol())){
            HttpSession session = request.getSession();
            session.setAttribute("clienteLogueado", usuario);

            response.sendRedirect("PantallaAgregar.html");
        }
        else {
            request.setAttribute("errorLogin", "Datos incorrectos o no Tiens un Perfil Hecho.");

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
