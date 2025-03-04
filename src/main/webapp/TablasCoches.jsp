<%@page import="java.util.*"%>
<%@page import="hibernate.Coche"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tabla de Coches</title>
    <link rel="stylesheet" href="StyleTablas.css"/>
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
    <header>
        <nav>
            <ul>
                <li><a href="PaginaPrincipal.jsp">Inicio</a></li>
                <li><a href="BoxCoches.jsp">Cajas</a>
                <li><a href="">Tablas</a></li>
            </ul>
        </nav>
        <div class="user-info">
            <label><%= (String) session.getAttribute("username") %></label>
            <form action="SvCerrarSesion" method="POST">
                <button type="submit">Cerrar sesión</button>
            </form>
        </div>
    </header>

    <div class="container">
        <h2>Lista de Coches</h2>
    
        <div class="table-container">
            <table>
                <tr>
                    <th>Matrícula</th>
                    <th>Marca</th>
                    <th>Modelo</th>
                    <th>Precio</th>
                    <th>Fecha de Lanzamiento</th>
                </tr>
                <%
                    List<Coche> listaCoches = (List<Coche>) session.getAttribute("listaCoches");
                    if (listaCoches != null && !listaCoches.isEmpty()) {
                        for(Coche car : listaCoches) {
                %>
                <tr>
                    <td><%= car.getMatricula() %></td>
                    <td><%= car.getMarca() %></td>
                    <td><%= car.getModelo() %></td>
                    <td><%= car.getPrecio() %> €</td>
                    <td><%= car.getFechaLanzamiento() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6" style="text-align: center;">No hay coches disponibles.</td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Esteban Riballo Moreno</p>
    </footer>
</body>
</html>
