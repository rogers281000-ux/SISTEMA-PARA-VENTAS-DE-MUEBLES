package com.mycompany.Muebles_tes.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Mapeado a la raíz de la aplicación
@WebServlet(name = "HomeServlet", urlPatterns = {"/", "/home"}) 
public class HomeServlet extends HttpServlet {

    // OMITIMOS init() y la lógica del DAO para evitar el error 500 si la BD está apagada

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Muestra la página principal: RUTA CORREGIDA (Sin el '/')
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}