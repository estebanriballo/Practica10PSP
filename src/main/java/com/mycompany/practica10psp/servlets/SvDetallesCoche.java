package com.mycompany.practica10psp.servlets;

import hibernate.Coche;
import hibernate.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;

@WebServlet(name = "SvDetallesCoche", urlPatterns = {"/SvDetallesCoche"})
public class SvDetallesCoche extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String matricula = request.getParameter("matricula");

        Coche coche = obtenerCochePorMatricula(matricula);

        HttpSession session = request.getSession();
        session.setAttribute("cocheDetalle", coche);

        response.sendRedirect("DetalleCoche.jsp");
    }

    private Coche obtenerCochePorMatricula(String matricula) {
        Coche coche = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            coche = session.get(Coche.class, matricula);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coche;
    }
}
