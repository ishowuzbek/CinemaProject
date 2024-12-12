package org.example.cinemaproject.servlets;

import jakarta.persistence.EntityManager;
import org.example.cinemaproject.entity.Movie;
import org.example.cinemaproject.entity.Room;
import org.example.cinemaproject.entity.Session;
import org.example.cinemaproject.repos.SessionRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;

import static org.example.cinemaproject.MyListener.EMF;

@WebServlet("/session/add")
public class AddSessionServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int movieId = Integer.parseInt(req.getParameter("movieId"));
        LocalTime startTime = LocalTime.parse(req.getParameter("startTime"));
        LocalTime endTime = LocalTime.parse(req.getParameter("endTime"));
        int roomId = Integer.parseInt(req.getParameter("roomId"));
        int price = Integer.parseInt(req.getParameter("price"));
        EntityManager entityManager = EMF.createEntityManager();
        Movie movie = entityManager.find(Movie.class, movieId);
        Room room = entityManager.find(Room.class, roomId);
        SessionRepo sessionRepo = new SessionRepo();
        Session session = new Session();
        session.setPrice(price);
        session.setStartDate(startTime);
        session.setEndDate(endTime);
        session.setRoom(room);
        session.setMovie(movie);
        sessionRepo.save(session);
        resp.sendRedirect("/admin");
    }
}
