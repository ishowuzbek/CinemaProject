<%@ page import="org.example.cinemaproject.repos.TicketRepo" %>
<%@ page import="org.example.cinemaproject.entity.Ticket" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.cinemaproject.entity.Seat" %>
<%@ page import="org.example.cinemaproject.entity.Session" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="org.example.cinemaproject.entity.Movie" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/12/2024
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Tickets</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .ticket-img {
      object-fit: cover;
      height: 250px;
      width: auto;
      max-width: 100%;
    }
    .card .col-md-4 {
      display: flex;
      justify-content: center;
      align-items: center;
    }
  </style>
</head>
<body>
<%
  int userId = Integer.parseInt(request.getParameter("userId"));
  TicketRepo ticketRepo = new TicketRepo();
  List<Ticket> tickets = ticketRepo.findAll();
%>
<div class="container my-5">
  <div class="d-flex justify-content-end mb-4">
    <a href="/" class="btn btn-secondary">Back</a>
  </div>
  <h1 class="text-center mb-4">My Tickets</h1>
  <%
    for (Ticket ticket : tickets) {
      if(ticket.getUser().getId().equals(userId)){
        Seat seat = ticket.getSeat();
        Session session1 = ticket.getSeat().getSession();
        Movie movie = session1.getMovie();
        String movieName = session1.getMovie().getName();
        Integer roomNumber = session1.getRoom().getRoomNumber();
        Integer price = session1.getPrice();
        LocalTime endDate = session1.getEndDate();
        LocalTime startDate = session1.getStartDate();
  %>
  <div class="card mb-3">
    <div class="row">
      <div class="col-4">
        <img src="/file/<%=movie.getId()%>" class="img-fluid rounded-start ticket-img" alt="Film Poster">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">Film Name: <%=movieName%></h5>
          <p class="card-text">
            <strong>Price:</strong> <%=price%><br>
            <strong>Seat Number:</strong> <%=seat.getSeatNo()%><br>
            <strong>Room Number:</strong> <%=roomNumber%>
          </p>
        </div>
      </div>
    </div>
  </div>
  <%
      }
    }
  %>
</div>
</body>
</html>
