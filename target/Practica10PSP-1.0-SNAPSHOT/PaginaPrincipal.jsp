<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Principal</title>
        <link rel="stylesheet" href="StylePrincipal.css"/>
        <script>
            function redirigir(valor) {
                document.getElementById("accion").value = valor;
                document.getElementById("formCajas").submit();
            }
        </script>
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
            <h1>Menú Principal</h1>
            <nav>
                <ul>
                    <li><a href="">Inicio</a></li>
                    
                    <form id="formCajas" action="SvCoches" method="POST">
                        <input type="hidden" name="accion" id="accion" value="">
                        <li><a href="#" onclick="redirigir('cajas'); return false;">Cajas</a></li>
                    </form>
                    
                    <form id="formCajas" action="SvCoches" method="POST">
                        <input type="hidden" name="accion" id="accion" value="">
                        <li><a href="#" onclick="redirigir('tablas'); return false;">Tablas</a></li>
                    </form>
                </ul>
            </nav>
            <label>
                <%= (String) session.getAttribute("username") %>
            </label>
            <form action="SvCerrarSesion" method="POST">
                <button type="submit">Cerrar sesión</button>
            </form>
            <label>
                <%= (Double) session.getAttribute("totalPrecioCoches") %> € Gastados en coches
            </label>
        </header>
        <footer>
            <p>&copy; 2025 Esteban Riballo Moreno</p>
        </footer>
    </body>
</html>
