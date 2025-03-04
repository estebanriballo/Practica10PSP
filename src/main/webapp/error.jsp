<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
    </head>
    <body>
        <h1>Se ha producido un error</h1>

        <p style="color: red;">
            <%
                String errorMensaje = (String) request.getAttribute("mensajeError");
                if (errorMensaje != null) {
                    out.print("Detalles del error: " + errorMensaje);
                } else {
                    out.print("Ha ocurrido un error desconocido.");
                }
            %>
        </p>

        <a href="index.jsp">Volver al inicio</a>

        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno</p>
        </footer>
    </body>
</html>
