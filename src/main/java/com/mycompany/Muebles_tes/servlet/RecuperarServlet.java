package com.mycompany.Muebles_tes.servlet;

import com.mycompany.Muebles_tes.dao.UsuarioDAO;
import com.mycompany.Muebles_tes.model.Usuario;
import java.io.IOException;

// CAMBIOS CLAVE: Reemplazamos 'javax.servlet' por 'jakarta.servlet'
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RecuperarServlet", urlPatterns = {"/Recuperar"})
public class RecuperarServlet extends HttpServlet {

    private final UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String token = request.getParameter("token");

        if (token != null) {
            // Flujo 2: El usuario hace clic en el enlace (token)
            Usuario usuario = dao.buscarPorToken(token);
            
            if (usuario != null) {
                // Si el token es válido y no ha expirado
                request.setAttribute("email", usuario.getEmail());
                request.setAttribute("token", token);
                request.getRequestDispatcher("cambiar_password.jsp").forward(request, response);
            } else {
                // Token inválido o expirado
                request.setAttribute("mensaje", "El enlace de recuperación es inválido o ha expirado. Solicita uno nuevo.");
                request.setAttribute("tipoMensaje", "error");
                request.getRequestDispatcher("recuperar.jsp").forward(request, response);
            }
        } else {
            // Flujo 1: Simplemente muestra el formulario de solicitud de email
            request.getRequestDispatcher("recuperar.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // La acción se usa para distinguir si es solicitud de token o cambio de password
        String action = request.getParameter("action");
        
        // Verifica si se está solicitando el cambio de password (viene de cambiar_password.jsp)
        if ("cambiar_password".equals(action)) {
            // Flujo 3: El usuario envía el nuevo password
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            if (dao.actualizarPassword(email, password)) {
                // Éxito: Redirigir al Login con mensaje de éxito
                request.setAttribute("mensaje", "Contraseña actualizada con éxito. Ya puedes iniciar sesión.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                // Fallo al actualizar en la DB
                request.setAttribute("mensaje", "Error al actualizar la contraseña. Intente de nuevo.");
                request.setAttribute("tipoMensaje", "error");
                request.getRequestDispatcher("cambiar_password.jsp").forward(request, response);
            }
            
        } else {
            // Flujo 1: El usuario envía el email para generar el token (viene de recuperar.jsp)
            String email = request.getParameter("email");
            String token = dao.generarTokenRecuperacion(email);
            
            if (token != null) {
                // Simulación de envío de correo
                String link = request.getRequestURL().toString() + "?token=" + token;
                request.setAttribute("mensaje", "Enlace de recuperación generado. El link es: " + link + " (Válido por 1 hora)");
                request.setAttribute("tipoMensaje", "success");
            } else {
                // Email no encontrado
                request.setAttribute("mensaje", "El email ingresado no existe o no está activo.");
                request.setAttribute("tipoMensaje", "error");
            }
            request.getRequestDispatcher("recuperar.jsp").forward(request, response);
        }
    }
}