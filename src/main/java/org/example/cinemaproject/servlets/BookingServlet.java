package org.example.cinemaproject.servlets;

import jakarta.persistence.EntityManager;
import org.example.cinemaproject.entity.*;
import org.example.cinemaproject.repos.SeatRepo;
import org.example.cinemaproject.repos.TicketRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import static org.example.cinemaproject.MyListener.EMF;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        Integer sessionId = Integer.parseInt(req.getParameter("sessionId"));
        String[] selectedSeats = req.getParameterValues("selectedSeats");

        if (selectedSeats == null || selectedSeats.length == 0) {
            req.setAttribute("error", "Please select at least one seat.");
            req.getRequestDispatcher("/booking.jsp").forward(req, resp);
            return;
        }


        EntityManager entityManager = EMF.createEntityManager();
        Users user = entityManager.find(Users.class, userId);
        if (user != null) {
            entityManager.getTransaction().begin();
            Session session = entityManager.find(Session.class, sessionId);
            SeatRepo seatRepo= new SeatRepo();
            TicketRepo ticketRepo= new TicketRepo();
            try {
                for (String selectedSeat : selectedSeats) {
                    Ticket ticket = new Ticket();
                    Seat seat= new Seat();
                    seat.setSeatStatus("sold");
                    seat.setSession(session);
                    seat.setSeatNo(Integer.parseInt(selectedSeat));
                    seatRepo.save(seat);
                    ticket.setSeat(seat);
                    ticket.setUser(user);
                    ticketRepo.save(ticket);
                }
                resp.sendRedirect("/");
            } catch (Exception e) {
                entityManager.getTransaction().rollback();
                e.printStackTrace();
                req.setAttribute("error", "Booking failed. Please try again.");
                req.getRequestDispatcher("/booking.jsp").forward(req, resp);
            } finally {
                entityManager.close();
            }
        } else {
            resp.sendRedirect("/signup");
        }
    }
}

