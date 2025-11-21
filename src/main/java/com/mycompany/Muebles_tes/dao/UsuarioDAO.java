package com.mycompany.Muebles_tes.dao;

import com.mycompany.Muebles_tes.model.Usuario; 
import java.sql.*;
import java.util.UUID; 

public class UsuarioDAO {

    // Método 1: Login con clave plana (NO HASH)
    public Usuario login(String email, String passwordPlano) {
        String sql = "SELECT * FROM Usuario WHERE email = ? AND password_hash = ? AND activo = TRUE";
        Connection conn = null; PreparedStatement ps = null; ResultSet rs = null;
        Usuario usuario = null;
        try {
            conn = ConexionDB.getConnection(); 
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, passwordPlano); 
            rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuarioId(rs.getInt("usuario_id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setEmail(rs.getString("email"));
                usuario.setRolId(rs.getInt("rol_id"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setActivo(rs.getBoolean("activo"));
            }
        } catch (SQLException e) { System.err.println("Error en el login (DAO): " + e.getMessage()); } 
        finally { ConexionDB.closeConnection(conn); }
        return usuario; 
    }
    
    // Método 2: Generar y guardar Token de Recuperación
    public String generarTokenRecuperacion(String email) {
        String token = UUID.randomUUID().toString().substring(0, 32);
        // Usamos NOW() para la fecha de registro (marca de tiempo del token)
        String sql = "UPDATE Usuario SET token_recuperacion = ?, fecha_registro = NOW() WHERE email = ?";
        Connection conn = null; PreparedStatement ps = null;
        try {
            conn = ConexionDB.getConnection(); ps = conn.prepareStatement(sql);
            ps.setString(1, token); ps.setString(2, email);
            if (ps.executeUpdate() > 0) { return token; }
        } catch (SQLException e) { System.err.println("Error al generar token: " + e.getMessage()); } 
        finally { ConexionDB.closeConnection(conn); }
        return null;
    }
    
    // Método 3: Buscar usuario por Token (válido por 1 hora)
    public Usuario buscarPorToken(String token) {
        // Verifica que el token no haya expirado (PostgreSQL: NOW() - INTERVAL '1 hour')
        String sql = "SELECT * FROM Usuario WHERE token_recuperacion = ? AND fecha_registro > NOW() - INTERVAL '1 hour'";
        Connection conn = null; PreparedStatement ps = null; ResultSet rs = null;
        Usuario usuario = null;
        try {
            conn = ConexionDB.getConnection(); ps = conn.prepareStatement(sql);
            ps.setString(1, token); rs = ps.executeQuery();
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setUsuarioId(rs.getInt("usuario_id"));
                usuario.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) { System.err.println("Error al buscar por token: " + e.getMessage()); } 
        finally { ConexionDB.closeConnection(conn); }
        return usuario;
    }
    
    // Método 4: Actualizar Password y Limpiar Token
    public boolean actualizarPassword(String email, String nuevaPasswordPlana) {
        // Setea el nuevo password_hash y elimina el token de un solo golpe
        String sql = "UPDATE Usuario SET password_hash = ?, token_recuperacion = NULL, fecha_registro = NULL WHERE email = ?";
        Connection conn = null; PreparedStatement ps = null;
        try {
            conn = ConexionDB.getConnection(); ps = conn.prepareStatement(sql);
            ps.setString(1, nuevaPasswordPlana); 
            ps.setString(2, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { System.err.println("Error al actualizar password: " + e.getMessage()); return false; } 
        finally { ConexionDB.closeConnection(conn); }
    }
}