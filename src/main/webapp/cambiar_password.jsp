<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cambiar Contraseña</title>
    <style>
        /* Reutilizamos estilos */
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background-color: #f4f4f4; }
        .container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); width: 350px; }
        h2 { text-align: center; color: #333; margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; font-weight: bold; color: #555; }
        input[type="password"] { width: 100%; padding: 10px; margin: 8px 0 15px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { background-color: #28a745; color: white; padding: 14px 20px; border: none; cursor: pointer; width: 100%; border-radius: 4px; font-size: 16px; transition: background-color 0.3s; }
        button:hover { background-color: #1e7e34; }
        .message { padding: 10px; margin-bottom: 15px; border-radius: 4px; text-align: center; }
        .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Establecer Nueva Contraseña</h2>
        
        <% String mensaje = (String) request.getAttribute("mensaje"); 
           if (mensaje != null) { %>
            <p class="message error">
                <%= mensaje %>
            </p>
        <% } %>

        <p>Estás cambiando la contraseña para: <b><%= request.getAttribute("email") %></b></p>
        
        <form action="Recuperar" method="POST"> 
            <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
            <input type="hidden" name="token" value="<%= request.getAttribute("token") %>">

            <label for="password"><b>Nueva Contraseña</b></label>
            <input type="password" placeholder="Ingresa tu nueva contraseña" name="password" required id="password">
            
            <label for="confirm_password"><b>Confirmar Contraseña</b></label>
            <input type="password" placeholder="Confirma la contraseña" name="confirm_password" required id="confirm_password">
            
            <button type="submit">Cambiar Contraseña</button>
        </form>
    </div>
    
    <script>
        // Validación en el cliente para coincidencia de contraseñas
        document.querySelector('form').onsubmit = function(e) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirm_password').value;
            
            if (password !== confirmPassword) {
                alert("Las contraseñas no coinciden. Por favor, verifica.");
                e.preventDefault();
            }
        };
    </script>
</body>
</html>