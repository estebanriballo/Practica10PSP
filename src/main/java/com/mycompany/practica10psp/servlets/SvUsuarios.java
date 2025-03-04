package com.mycompany.practica10psp.servlets;

import hibernate.Coche;
import hibernate.HibernateUtil;
import hibernate.Usuario;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.persistence.TypedQuery;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            
            TypedQuery<Usuario> query = session.createQuery("FROM Usuario WHERE username = :username AND password = :password", Usuario.class);
            query.setParameter("username", username);
            query.setParameter("password", password);

            Usuario user = query.getResultList().stream().findFirst().orElse(null);

            Double totalPrecio = 0.0;

            if (user != null) {
                BigDecimal totalPrecioBD = (BigDecimal) session.createQuery(
                    "SELECT SUM(c.precio) FROM Coche c WHERE c.dueño = :dueño"
                )
                .setParameter("dueño", user)
                .getSingleResult();

                totalPrecio = (totalPrecioBD != null) ? totalPrecioBD.doubleValue() : 0.0;

                if (totalPrecio == null) {
                    totalPrecio = 0.0;
                }
            }

            tx.commit();

            if (user != null) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("username", username);
                httpSession.setAttribute("sesionIniciada", true);
                httpSession.setAttribute("totalPrecioCoches", totalPrecio);

                response.sendRedirect("PaginaPrincipal.jsp");
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            Logger.getLogger(SvUsuarios.class.getName()).log(Level.SEVERE, null, e);

            request.setAttribute("mensajeError", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}

