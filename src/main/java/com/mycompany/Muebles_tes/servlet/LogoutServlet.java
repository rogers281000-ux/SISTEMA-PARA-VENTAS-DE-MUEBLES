package com.mycompany.Muebles_tes.servlet;

import java.io.IOException;

// CAMBIOS CLAVE: Reemplazamos 'javax.servlet' por 'jakarta.servlet'
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false); // No crear sesión si no existe
        if (session != null) {
            session.invalidate(); // Invalida y elimina todos los atributos de la sesión
        }
        
        // Redirige de nuevo al Login
        // Usamos "/Login" para asegurar que redirige correctamente a la URL del LoginServlet
        response.sendRedirect("Login");
    }
}