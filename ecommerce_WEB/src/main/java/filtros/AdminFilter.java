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

// La anotación @WebFilter define qué URLs va a proteger este guardia.
// Puedes listar páginas específicas o usar comodines (*).
@WebFilter(urlPatterns = {"/admin_dashboard.jsp", "/productos_admin.jsp", "/pedidos_admin.jsp", "/ProductoServlet", "/PedidoServlet"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Método que se ejecuta al arrancar el servidor (lo dejamos vacío)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        // Convertimos los objetos a su versión HTTP para poder manejar sesiones y redirecciones
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        // Obtenemos la sesión actual sin crear una nueva (por eso usamos 'false')
        HttpSession session = req.getSession(false);
        
        // Verificamos si existe la sesión y si tiene el objeto "adminLogueado" que guardamos en el LoginServlet
        boolean sesionIniciada = (session != null && session.getAttribute("adminLogueado") != null);

        if (sesionIniciada) {
            // El usuario tiene el "gafete" de admin. Lo dejamos continuar su camino.
            chain.doFilter(request, response);
        } else {
            // El usuario NO ha iniciado sesión. Lo bloqueamos y redirigimos al login.
            res.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }

    @Override
    public void destroy() {
        // Método que se ejecuta al detener el filtro (lo dejamos vacío)
    }
}