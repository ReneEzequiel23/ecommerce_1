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
import negocio.Pedido;
import persistencia.PedidoDAO;

/**
 *
 * @author edgar
 */
@WebServlet(name = "PedidosSerlet", urlPatterns = {"/PedidosSerlet"})
public class PedidosSerlet extends HttpServlet {
    PedidoDAO dao=new PedidoDAO();
   

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
            List<Pedido> lista = dao.listarTodos();
            request.setAttribute("listaPedidodos", lista);
            request.getRequestDispatcher("administrarPedidos.jsp").forward(request, response);

        } else if (accion.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));

            //Buscar ese libro en la BD
            Pedido pedidoAEditar = dao.obtenerPorId(id);

            //Mandar el libro a la vista
            request.setAttribute("pedidos", pedidoAEditar);
            request.getRequestDispatcher("pedidoAEditar.jsp").forward(request, response);
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
//        request.setCharacterEncoding("UTF-8");
//
//        // Obtenemos una acción secreta que enviaremos desde el formulario de editar
//        String accion = request.getParameter("accion");
//
//        String calle = request.getParameter("calle");
//        String ciudad = request.getParameter("ciudad");
//        String estado = request.getParameter("estado");
//        String codigo = request.getParameter("codigo");
//        int idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
//        if ("actualizar".equals(accion)) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            Pedido direccionEditado = new Pedido(id, calle, ciudad, estado, codigo, idUsuario);
//            dao.actualizar(direccionEditado);
//        } else {
//            // Si no hay acción de actualizar, significa que viene de "crearProducto.jsp"
//            Pedido nuevoDireccion = new Pedido(0, calle, ciudad, estado, codigo, idUsuario);
//            dao.insertar(nuevoDireccion);
//        }
//        // Redirigimos de vuelta al catálogo
//        response.sendRedirect("configurarDireccion.jsp");
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
