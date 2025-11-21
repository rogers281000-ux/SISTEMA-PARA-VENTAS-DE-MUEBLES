<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Muebles TES - Iniciar Sesión</title>
    <style>
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background-color: #f0f0f0; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); }
        .login-card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15); width: 380px; max-width: 90%; }
        h2 { text-align: center; color: #333; margin-bottom: 30px; font-weight: 600; }
        .input-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
        input[type="email"], input[type="password"] { width: 100%; padding: 12px; border: 1px solid #ddd; border-radius: 6px; box-sizing: border-box; font-size: 16px; transition: border-color 0.3s; }
        input[type="email"]:focus, input[type="password"]:focus { border-color: #4a7d7f; outline: none; }
        button { background-color: #4a7d7f; color: white; padding: 14px 20px; border: none; cursor: pointer; width: 100%; border-radius: 6px; font-size: 17px; font-weight: bold; transition: background-color 0.3s; }
        button:hover { background-color: #3d686a; }
        .error-message { padding: 10px; margin-bottom: 20px; border-radius: 6px; text-align: center; }
        .fail { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .secondary-links { text-align: center; margin-top: 20px; }
        .secondary-links a { color: #007bff; text-decoration: none; font-size: 14px; margin: 0 10px; }
        .secondary-links a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>Iniciar Sesión</h2>
        
        <% String error = (String) request.getAttribute("errorLogin");
           String mensaje = (String) request.getAttribute("mensaje");
           
           if (error != null) { %>
            <p class="error-message fail"><%= error %></p>
        <% } else if (mensaje != null) { %>
            <p class="error-message success"><%= mensaje %></p>
        <% } %>

        <form action="Login" method="POST"> 
            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" placeholder="Email Registrado" name="email" required>
            </div>
            
            <div class="input-group">
                <label for="password">Contraseña</label>
                <input type="password" placeholder="Ingresa tu Contraseña" name="password" required>
            </div>
            
            <button type="submit">Ingresar</button>
        </form>
        
        <div class="secondary-links">
            <a href="Recuperar">¿Olvidaste tu Contraseña?</a>
            <a href="registro.jsp">Regístrate</a>
        </div>
    </div>
</body>
</html>