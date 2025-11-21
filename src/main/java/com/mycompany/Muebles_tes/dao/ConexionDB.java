package com.mycompany.Muebles_tes.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    
    private static final String URL = "jdbc:postgresql://localhost:12345/muebles_db"; // <-- Revisa tu puerto
    private static final String USER = "postgres";
    private static final String PASS = "12345"; // <-- TU CONTRASEÑA

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver"); 
            conn = DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.err.println("Error: Driver de PostgreSQL no encontrado: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Error de conexión a la BD: Revisa el puerto y la BD. Detalle: " + e.getMessage());
        }
        return conn;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { System.err.println("Error al cerrar conexión: " + e.getMessage()); }
        }
    }
}