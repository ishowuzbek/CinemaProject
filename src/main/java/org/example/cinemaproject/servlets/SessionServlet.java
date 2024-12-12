package org.example.cinemaproject.servlets;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import org.example.cinemaproject.entity.Session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static org.example.cinemaproject.MyListener.EMF;

@WebServlet("/session")
public class SessionServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String str = req.getParameter("movieId");
        if (str != null) {
            int movieId = Integer.parseInt(str);
            EntityManager entityManager = EMF.createEntityManager();

            List<Session> sessions = entityManager.createNativeQuery("""
                 SELECT * FROM session WHERE movie_id = :movieId
                 ORDER BY startdate, enddate
                """, Session.class)
                    .setParameter("movieId", movieId)
                    .getResultList();

            req.setAttribute("sessions", sessions);
            req.getRequestDispatcher("session.jsp?movieId="+movieId).forward(req, resp);
        }
        resp.sendRedirect("/");
            }
}

