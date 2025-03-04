<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro usuario</title>
        <link rel="stylesheet" href="StyleRegistro.css"/>
    </head>
    <body>
        <main>
            <h2>Registro</h2>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <p style="color: red;"><%= error %></p>
            <% } %>

            <form action="SvRegistrarUsuario" method="POST">
                <div>
                    <label>Email: </label>
                    <input type="email" name="email" required>
                </div>
                <div>
                    <label>Nombre de usuario: </label>
                    <input type="text" name="username" required>
                </div>
                <div>
                    <label>Contraseña: </label>
                    <input type="password" name="password" required>
                </div>
                <div>
                    <input type="submit" value="Enviar">
                </div>
            </form>
        </main>
        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno</p>
        </footer>
    </body>
</html>
