package org.example.cinemaproject.servlets;

import jakarta.persistence.EntityManager;
import org.example.cinemaproject.entity.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.registry.infomodel.User;
import java.io.IOException;
import java.util.Optional;

import static org.example.cinemaproject.MyListener.EMF;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
           req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");
        EntityManager entityManager = EMF.createEntityManager();

        try {
            Users findUser = entityManager.createQuery(
                            "SELECT u FROM Users u WHERE u.name = :name AND u.password = :password", Users.class)
                    .setParameter("name", name)
                    .setParameter("password", password)
                    .getResultStream()
                    .findFirst()
                    .orElse(null);

            if (findUser != null) {
                if ("admin".equals(findUser.getRole())) {
                    req.getSession().setAttribute("user", findUser);
                    resp.sendRedirect("admin.jsp");
                } else {
                    req.getSession().invalidate();
                    req.getSession().setAttribute("user", findUser);
                    resp.sendRedirect("/");
                }
            } else {
                resp.sendRedirect("signup.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Error retrieving user", e);
        } finally {
            entityManager.close();
        }
    }

}
