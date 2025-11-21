<%@page import="com.mycompany.Muebles_tes.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // =================================
    // FILTRO DE SEGURIDAD
    // =================================
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
    
    // Si no hay sesión O el rol no es Administrador (rol_id 1), redirigir al login
    if (usuario == null || usuario.getRolId() != 1) {
        response.sendRedirect("Login");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard | Muebles TES Administración</title>
    <style>
        /* Estilos Base para la estructura del Dashboard */
        body { font-family: 'Arial', sans-serif; margin: 0; background-color: #f8f9fa; }
        .dashboard-container { display: flex; min-height: 100vh; }
        
        /* Sidebar - Menú Lateral (Diseño elegante) */
        .sidebar {
            width: 250px;
            background-color: #343a40; /* Fondo oscuro y profesional */
            color: white;
            padding: 20px 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
        }
        .sidebar h3 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.5em;
            padding-bottom: 15px;
            color: #ffc107; /* Un toque de color para el logo/título */
        }
        .sidebar ul { list-style: none; padding: 0; }
        .sidebar ul li a {
            display: block;
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            transition: background-color 0.3s;
        }
        .sidebar ul li a:hover { background-color: #495057; }
        
        /* Contenido Principal */
        .main-content { flex-grow: 1; padding: 30px; }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 1px solid #dee2e6;
            padding-bottom: 20px;
        }
        .header .user-info { font-weight: bold; }
        .header .logout a {
            color: white;
            background-color: #dc3545;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 5px;
            transition: opacity 0.3s;
        }
        .header .logout a:hover { opacity: 0.8; }
    </style>
</head>
<body>
    <div class="dashboard-container">
        
        <div class="sidebar">
            <h3>Muebles TES Admin</h3>
            <ul>
                <li><a href="dashboard.jsp"> Dashboard Principal</a></li>
                <li><a href="ProductoServlet?accion=listar">Productos</a></li>
                <li><a href="CategoriaServlet?accion=listar">Categorías</a></li>
                <li><a href="PedidoServlet?accion=listar">Pedidos</a></li>
                <li><a href="UsuarioServlet?accion=listar">Usuarios</a></li>
            </ul>
        </div>

        <div class="main-content">
            <div class="header">
                <h1>Panel de Administración</h1>
                <div class="user-info">
                    Hola, **<%= usuario.getNombre() %>**
                    <div class="logout">
                        <a href="LogoutServlet">Cerrar Sesión</a>
                    </div>
                </div>
            </div>
            
            <h2>Resumen del Sistema</h2>
            <p>Avance 2: pantalla funcional de login y recuperacion de contraseña 
                kenny rogers, litzy yagual, christian lindao, andrade pato.</p>
            
             <div style="padding: 20px; background-color: #e9ecef; border-radius: 8px;">
                **SEGUIMOS TRABAJANDO EN EL PROYECTO "SISTEMA PARA UNA EMPRESA DE VENTA DE MUEBLES"**
                
            </div>
            
            <div style="padding: 20px; background-color: #e9ecef; border-radius: 8px;">
                **Avance 2:** Inicia sesión con: **`admin@muebles.com`** / **`AvanceSimple123`**
                
            </div>
        </div>

    </div>
</body>
</html>