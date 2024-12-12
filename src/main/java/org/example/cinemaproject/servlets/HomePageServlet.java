package org.example.cinemaproject.servlets;


import org.example.cinemaproject.entity.Users;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet("/")
public class HomePageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Random rand = new Random();
        if (session.getAttribute("user") == null) {
            int randNum = rand.nextInt(9000) + 1000;
            session.setAttribute("user", new Users(randNum));
        }
        req.getRequestDispatcher("homepage.jsp").forward(req, resp);
    }
}
