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
import negocio.Direccion;
import negocio.Usuario;
import persistencia.DireccionDAO;


/**
 *
 * @author edgar
 */
@WebServlet(name = "DireccionServlet", urlPatterns = {"/DireccionServlet"})
public class DireccionServlet extends HttpServlet {
    DireccionDAO dao=new DireccionDAO();
    

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
            List<Direccion> lista = dao.listarTodos();
            request.setAttribute("listaDireccion", lista);
            request.getRequestDispatcher("configurarDireccion.jsp").forward(request, response);

        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            response.sendRedirect("DireccionServlet?accion=listar");
        } else if (accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));

            //Buscar ese libro en la BD
            Direccion direccionAEditar = dao.obtenerPorId(id);

            //Mandar el libro a la vista
            request.setAttribute("direccion", direccionAEditar);
            request.getRequestDispatcher("configurarDireccion.jsp").forward(request, response);
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

        String calle = request.getParameter("calle");
        String ciudad = request.getParameter("ciudad");
        String estado = request.getParameter("estado");
        String codigo = request.getParameter("codigo");
        int idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
        if ("actualizar".equals(accion)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Direccion direccionEditado = new Direccion(id, calle, ciudad, estado, codigo, idUsuario);
            dao.actualizar(direccionEditado);
        } else {
            // Si no hay acción de actualizar, significa que viene de "crearProducto.jsp"
            Direccion nuevoDireccion = new Direccion(0, calle, ciudad, estado, codigo, idUsuario);
            dao.insertar(nuevoDireccion);
        }
        // Redirigimos de vuelta al catálogo
        response.sendRedirect("configurarDireccion.jsp");
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
