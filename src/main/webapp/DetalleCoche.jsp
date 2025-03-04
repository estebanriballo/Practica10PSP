<%@page import="hibernate.Coche"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalles del Coche</title>
    <link rel="stylesheet" href="StyleDetalleCoche.css"/>
</head>
<body>
    <article class="detalle-container">
        <%
            Coche coche = (Coche) session.getAttribute("cocheDetalle");
            if (coche != null) {
        %>
            <h2><%= coche.getMarca() %> <%= coche.getModelo() %></h2>
            <img src="<%= coche.getImagen() %>" alt="Imagen de <%= coche.getMarca() %>">
            <p><strong>Matrícula:</strong> <%= coche.getMatricula() %></p>
            <p><strong>Precio:</strong> $<%= coche.getPrecio() %></p>
            <p><strong>Fecha de lanzamiento:</strong> <%= coche.getFechaLanzamiento() %></p>
            <br>
            <a href="BoxCoches.jsp">Volver</a>
        <%
            } else {
        %>
            <p>No se encontraron detalles del coche.</p>
        <%
            }
        %>
    </article>
</body>
</html>
