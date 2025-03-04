<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="StyleInicioSesion.css">
    </head>
    <body>
        <header>
            <h1>Inicio Sesión</h1>
        </header>
        <main>
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <p style="color: red;"><%= error %></p>
            <% } %>
            <form action="SvUsuarios" method="GET">
                <p><label>Usuario: </label> <input type="text" name="username" required></p>
                <p><label>Contraseña: </label> <input type="password" name="password" required></p>
                <button type="submit">Entrar</button>
            </form>
            <a href="RegistrarUsuario.jsp">
                <button href="RegistrarUsuario.jsp">Registrar usuario</button>
            </a>
        </main>
        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno</p>
        </footer>
    </body>
</html>
