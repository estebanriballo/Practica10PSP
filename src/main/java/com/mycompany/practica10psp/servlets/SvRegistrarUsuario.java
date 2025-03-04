package com.mycompany.practica10psp.servlets;

import hibernate.HibernateUtil;
import hibernate.Usuario;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SvRegistrarUsuario", urlPatterns = {"/SvRegistrarUsuario"})
public class SvRegistrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction tx = session.beginTransaction();

            Usuario newUser = new Usuario();
            newUser.setUsername(username);
            newUser.setEmail(email);
            newUser.setPassword(password);

            session.persist(newUser);
            tx.commit();

            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            request.setAttribute("error", "Usuario o Email en uso");
            request.getRequestDispatcher("RegistrarUsuario.jsp").forward(request, response);
        }
    }
}
