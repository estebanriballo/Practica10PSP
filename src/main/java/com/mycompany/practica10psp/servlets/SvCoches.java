package com.mycompany.practica10psp.servlets;

import hibernate.Coche;
import hibernate.HibernateUtil;
import hibernate.Usuario;
import jakarta.persistence.TypedQuery;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

@WebServlet(name = "SvCoches", urlPatterns = {"/SvCoches"})
public class SvCoches extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);
        
        if (httpSession != null && httpSession.getAttribute("username") != null) {
            String username = (String) httpSession.getAttribute("username");
            String accion = request.getParameter("accion"); // Obtener el parámetro

            try (Session session = HibernateUtil.getSessionFactory().openSession()) {
                TypedQuery<Usuario> userQuery = session.createQuery("FROM Usuario WHERE username = :username", Usuario.class);
                userQuery.setParameter("username", username);
                Usuario usuario = userQuery.getSingleResult();

                TypedQuery<Coche> query = session.createQuery("SELECT c FROM Coche c WHERE c.dueño = :dueño", Coche.class);
                query.setParameter("dueño", usuario);

                List<Coche> coches = query.getResultList();
                httpSession.setAttribute("listaCoches", coches);
            }

            if ("cajas".equals(accion)) {
                response.sendRedirect("BoxCoches.jsp");
            } else if ("tablas".equals(accion)) {
                response.sendRedirect("TablasCoches.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }
}