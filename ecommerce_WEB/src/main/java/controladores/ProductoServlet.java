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
import persistencia.ProductoDAO;

/**
 *
 * @author renee
 */
@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {
    ProductoDAO dao = new ProductoDAO();


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
            List<Producto> lista = dao.listarTodos();
            request.setAttribute("listaProductos", lista);
            request.getRequestDispatcher("gestionarCatalogoProductos.jsp").forward(request, response);
            
        } else if (accion.equals("eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.eliminar(id);
            response.sendRedirect("ProductoServlet?accion=listar");
        }else if (accion.equals("editar")) {
            // 1. Obtener el ID del libro que queremos editar
            int id = Integer.parseInt(request.getParameter("id"));
            
            // 2. Buscar ese libro en la BD
            Producto libroAEditar = dao.obtenerPorId(id);
            
            // 3. Mandar el libro a la vista (JSP)
            request.setAttribute("producto", libroAEditar);
            request.getRequestDispatcher("editarProducto.jsp").forward(request, response);
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
        
        // Atrapamos los datos comunes
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int existencia = Integer.parseInt(request.getParameter("cantidad"));
        int categoriaId = Integer.parseInt(request.getParameter("categoria"));
        
        // Si la acción es "actualizar", hacemos el UPDATE
        if ("actualizar".equals(accion)) {
            // Atrapamos el ID oculto
            int id = Integer.parseInt(request.getParameter("id"));
            Producto libroEditado = new Producto(id, nombre, descripcion, precio, existencia, categoriaId);
            dao.actualizar(libroEditado);
        } else {
            // Si no hay acción de actualizar, significa que viene de "crearProducto.jsp"
            Producto nuevoLibro = new Producto(0, nombre, descripcion, precio, existencia, categoriaId);
            dao.insertar(nuevoLibro);
        }
        
        // Redirigimos de vuelta al catálogo
        response.sendRedirect("ProductoServlet?accion=listar");
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
