package com.mycompany.Muebles_tes.servlet;

import com.mycompany.Muebles_tes.dao.UsuarioDAO;
import com.mycompany.Muebles_tes.model.Usuario;
import java.io.IOException;

// Usando imports de Jakarta EE
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UsuarioDAO dao = new UsuarioDAO();
        Usuario usuario = dao.login(email, password); 

        if (usuario != null) {
            // Login exitoso
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogueado", usuario); 
            
            // Redirección segura usando la ruta de contexto
            if (usuario.getRolId() == 1) { 
                // Admin: Redirige a la vista de administrador
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp"); 
            } else {
                // Cliente: Redirige a la página principal
                // Usamos request.getContextPath() para resolver el error 404
                response.sendRedirect(request.getContextPath() + "/index.html"); 
            }
        } else {
            // Login fallido
            request.setAttribute("errorLogin", "Email o contraseña incorrectos. Intente de nuevo.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Muestra la vista de Login si se accede directamente por GET
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}