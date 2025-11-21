package com.mycompany.Muebles_tes.model;

import java.sql.Timestamp;

public class Usuario {
    
    // 1. CAMPOS PRIVADOS (Debe coincidir con la base de datos)
    private int usuarioId;
    private String nombre;
    private String apellido;
    private String email;
    private String passwordHash;
    private int rolId;
    private String telefono;
    private String direccion;
    private String tokenRecuperacion;
    private Timestamp fechaRegistro;
    private boolean activo;
    
    // 2. Constructor vacío (Necesario para que el DAO cree instancias)
    public Usuario() {}
    
    // 3. GETTERS (Métodos para OBTENER el valor)
    
    public int getUsuarioId() {
        return usuarioId;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public String getEmail() {
        return email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public int getRolId() {
        return rolId;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTokenRecuperacion() {
        return tokenRecuperacion;
    }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    // Usamos 'is' para booleanos por convención de Java
    public boolean isActivo() {
        return activo;
    }
    
    // 4. SETTERS (Métodos para ASIGNAR el valor)
    
    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId; 
    }

    public void setNombre(String nombre) {
        this.nombre = nombre; 
    }

    public void setApellido(String apellido) {
        this.apellido = apellido; 
    }

    public void setEmail(String email) {
        this.email = email; 
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash; 
    }

    public void setRolId(int rolId) {
        this.rolId = rolId; 
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono; 
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion; 
    }

    public void setTokenRecuperacion(String tokenRecuperacion) {
        this.tokenRecuperacion = tokenRecuperacion; 
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro; 
    }

    public void setActivo(boolean activo) {
        this.activo = activo; 
    }
}