<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Recuperar Contraseña</title>
    <style>
        /* Reutilizamos los estilos del login */
        body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; background-color: #f0f0f0; background-image: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%); }
        .container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); width: 350px; }
        h2 { text-align: center; color: #333; margin-bottom: 20px; }
        input[type="email"] { width: 100%; padding: 10px; margin: 8px 0 20px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { background-color: #007bff; color: white; padding: 14px 20px; border: none; cursor: pointer; width: 100%; border-radius: 4px; font-size: 16px; transition: background-color 0.3s; }
        button:hover { background-color: #0056b3; }
        .message { padding: 10px; margin-bottom: 15px; border-radius: 4px; text-align: center; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .back-link { display: block; text-align: center; margin-top: 15px; color: #007bff; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Recuperar Contraseña</h2>
        
        <% String mensaje = (String) request.getAttribute("mensaje"); 
           String tipoMensaje = (String) request.getAttribute("tipoMensaje"); 

           if (mensaje != null) { %>
            <p class="message <%= tipoMensaje %>">
                <%= mensaje %>
            </p>
        <% } %>

        <p>Ingresa tu email para recibir el enlace de recuperación.</p>
        
        <form action="Recuperar" method="POST"> 
            <label for="email"><b>Email</b></label>
            <input type="email" placeholder="Email Registrado" name="email" required>
            
            <button type="submit">Enviar Enlace</button>
        </form>
        
        <a href="Login" class="back-link">Volver al Login</a>
    </div>
</body>
</html>