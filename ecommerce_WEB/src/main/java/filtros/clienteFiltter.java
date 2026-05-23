/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filtros;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author edgar
 */
@WebFilter(urlPatterns = {"/PerfilUsuario.jsp", "/carritoCompras.jsp", "/catalogoProductos.jsp",
    "/compraRealizada.jsp", "/configurarDireccion.jsp", "/crearResena.jsp", "/detallesDelProducto.jsp",
    "/gestionDePedidos.jsp", "/administrarUsuarios.jsp", "/procesoDeCompra.jsp", 
    "/registroUsuario.jsp"})
public class clienteFiltter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        // Verificamos si existe la sesión y si tiene el objeto "adminLogueado" que guardamos en el LoginServlet
        boolean sesionIniciada = (session != null && session.getAttribute("clienteLogueado") != null);

        if (sesionIniciada) {
            chain.doFilter(request, response);
        } else {
            res.sendRedirect(req.getContextPath() + "/PantallaAgregar.html");
        }
    }

    @Override
    public void destroy() {
    }
    
}
