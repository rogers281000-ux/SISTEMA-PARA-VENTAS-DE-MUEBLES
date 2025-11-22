-- #################################################
-- # SCRIPT DE ESQUEMA DE BASE DE DATOS - MUEBLES_TES
-- # Base de Datos: PostgreSQL
-- # Nombre de la BD: muebles_db
-- #################################################

-- 1. TABLA ROL
CREATE TABLE rol (
    rol_id SERIAL PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL
);
INSERT INTO rol (nombre_rol) VALUES ('Administrador'), ('Cliente');


-- 2. TABLA USUARIO (Avance 2.2 - Login)
CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL, 
    rol_id INT NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255),
    token_recuperacion VARCHAR(100),
    fecha_registro TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    
    CONSTRAINT fk_rol
        FOREIGN KEY (rol_id)
        REFERENCES rol (rol_id)
);

-- Datos de prueba para el Login
INSERT INTO usuario (nombre, apellido, email, password_hash, rol_id, telefono, direccion, activo)
VALUES ('Admin', 'Sistema', 'admin@muebles.com', 'AvanceSimple123', 1, '0000000000', 'Oficina Central', TRUE);
INSERT INTO usuario (nombre, apellido, email, password_hash, rol_id, telefono, direccion, activo)
VALUES ('Juan', 'Perez', 'cliente@muebles.com', 'Cliente123', 2, '1111111111', 'Calle Falsa 123', TRUE);


-- 3. TABLA CATEGORIA (Requerida para Producto)
CREATE TABLE categoria (
    categoria_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
INSERT INTO categoria (nombre) VALUES ('Sillas'), ('Mesas'), ('Sofás');


-- 4. TABLA PRODUCTO (Avance 3.0 - CRUD)
CREATE TABLE producto (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    imagen VARCHAR(255),
    categoria_id INT NOT NULL,
    fecha_registro TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    activo BOOLEAN DEFAULT TRUE,
    
    CONSTRAINT fk_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categoria (categoria_id)
);

-- Datos de prueba para el CRUD
INSERT INTO producto (nombre, descripcion, precio, stock, imagen, categoria_id)
VALUES 
('Silla Ejecutiva Ergonómica', 'Silla cómoda con soporte lumbar.', 125.50, 20, 'sillas/ejecutiva.jpg', 1),
('Mesa de Centro Moderna', 'Mesa de madera oscura, minimalista.', 75.99, 15, 'mesas/moderna.jpg', 2);
