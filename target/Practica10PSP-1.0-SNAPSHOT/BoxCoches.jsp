<%@page import="java.util.*"%>
<%@page import="hibernate.Coche"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Box Coches</title>
        <link rel="stylesheet" href="StyleBox.css"/>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if (session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <article>
            <header>
                <h1>Box Coches</h1>
                <nav>
                    <ul>
                        <li><a href="PaginaPrincipal.jsp">Inicio</a></li>
                        <li><a href="">Cajas</a></li>
                        <li><a href="TablasCoches.jsp">Tablas</a></li>
                    </ul>
                </nav>
                <label>
                    <%= (String) session.getAttribute("username") %>
                </label>
                <form action="SvCerrarSesion" method="POST">
                    <button type="submit">Cerrar sesión</button>
                </form>
            </header>
            <br>
            <div class="coches-container"> <!-- Aquí comienza el contenedor flex -->
                <%
                    List<Coche> listaCoches = (List<Coche>) session.getAttribute("listaCoches");

                    if (listaCoches != null && !listaCoches.isEmpty()) {
                        for(Coche car : listaCoches) {
                %>
                <div class="coche">
                    <a href="SvDetallesCoche?matricula=<%= car.getMatricula() %>">
                        <img src="<%= car.getImagen() %>" alt="Imagen de <%= car.getMarca() %> <%= car.getModelo() %>">
                    </a>
                    <span><a href="SvDetallesCoche?matricula=<%= car.getMatricula() %>"><%= car.getMarca() %> <%= car.getModelo() %></a></span>
                </div>
                <%
                        }
                    } else {
                %>
                <p>No hay coches disponibles.</p>
                <%
                    }
                %>
            </div> <!-- Aquí termina el contenedor flex -->
        </article>

        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno</p>
        </footer>
    </body>
</html>
