/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controladores;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;
import negocio.Resena;
import persistencia.ResenaDao;
/**
 *
 * @author ReneEzequiel23 & EdgarAcevedoAcosta
 */
@WebServlet(name = "ResenaServlet", urlPatterns = {"/ResenaServlet"})
public class ResenaServlet extends HttpServlet {
    ResenaDao dao=new ResenaDao();
    
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
            List<Resena> lista = dao.listarTodos();
            request.setAttribute("listaResenas", lista);
            request.getRequestDispatcher("gestionarReseñas.jsp").forward(request, response);
            
        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            response.sendRedirect("ResenaServlet?accion=listar");
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
        
        
        int calificacion = Integer.parseInt(request.getParameter("calificacion"));
        String comentario = request.getParameter("comentario");
        Date fecha = Date.valueOf(request.getParameter("fecha"));
        int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
        int producto_id = Integer.parseInt(request.getParameter("producto_id"));
        
        
        if ("eliminar".equals(accion)) {
            
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
        } else {
            // Si no hay acción de actualizar, significa que viene de "crearProducto.jsp"
            Resena nuevoLibro = new Resena(0, calificacion, comentario, fecha, usuario_id, producto_id);
            dao.crearResena(nuevoLibro);
        }
        
        // Redirigimos de vuelta al catálogo
        response.sendRedirect("catalogoProductos.jsp");
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
