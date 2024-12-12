package org.example.cinemaproject.servlets;

import org.example.cinemaproject.entity.Users;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class FilterServlet  extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        String uri = req.getRequestURI();

        if (uri.contains("/admin") || uri.contains("/add")) {
            HttpSession session = req.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            Users user = (Users) session.getAttribute("user");
            if (!"admin".equals(user.getRole())) {
                res.sendRedirect("/");
                return;
            }
        }

        chain.doFilter(req, res);
    }
}
