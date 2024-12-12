<%@ page import="org.example.cinemaproject.entity.Movie" %>
<%@ page import="org.example.cinemaproject.repos.MovieRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.cinemaproject.repos.GenreRepo" %>
<%@ page import="org.example.cinemaproject.entity.Genre" %>
<%@ page import="org.example.cinemaproject.entity.Users" %>
<%@ page import="org.example.cinemaproject.entity.Ticket" %>
<%@ page import="org.example.cinemaproject.repos.TicketRepo" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/9/2024
  Time: 1:13 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Movies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .movie-card {
            margin-bottom: 20px;
        }

        .movie-card img {
            height: 300px;
            object-fit: cover;
        }

        .genres-bar {
            background-color: #343a40;
            padding: 10px 0;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .genres-bar ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .genres-bar a {
            font-weight: bold;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .genres-bar a:hover {
            background-color: #0d6efd;
            color: #ffffff;
        }

        .navbar {
            margin-bottom: 20px;
            background-color: #343a40;
        }

        .navbar-brand {
            color: #ffffff;
            font-weight: bold;
        }

        .navbar-brand:hover {
            color: #0d6efd;
        }

        .btn-dark {
            background-color: #0d6efd;
            border: none;
        }

        .btn-dark:hover {
            background-color: #0a58ca;
        }

        .card-title {
            font-size: 1.25rem;
            color: #0d6efd;
        }

        .card-title:hover {
            text-decoration: underline;
        }

        .card-body p {
            color: #6c757d;
        }
    </style>
</head>
<body>
<%
    Users user = (Users) session.getAttribute("user");
    final Integer userId;
    if (user != null) {
        userId = user.getId();
    } else {
        userId = null;
    }
    String filmGenre = request.getParameter("genre");
%>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">BOOMovies</a>
        <div class="d-flex" style="gap: 10px;">
             <%
                TicketRepo ticketRepo=new TicketRepo();
                List<Ticket> tickets = ticketRepo.findAll();
                 List<Ticket> ticketTS = tickets.stream().filter(ticket -> ticket.getUser().getId().equals(userId)).toList();
                 if (!ticketTS.isEmpty()){
                    %>
            <a href="/mytickets?userId=<%=userId%>" class="btn" style="background-color: #28a745; color: white;">My Tickets</a>
            <%
                }

            %>
            <a href="/login?userId=<%=userId%>" class="btn" style="background-color: #007bff; color: white;">Login</a>        </div>
    </div>
</nav>
<div class="genres-bar">
    <ul>
        <li><a href="?genre=all">All</a></li>
        <%
            GenreRepo genreRepo = new GenreRepo();
            List<Genre> genres = genreRepo.findAll();
            for (Genre genre : genres) {
        %>
        <li><a href="?genre=<%=genre.getName()%>"><%=genre.getName()%></a></li>
        <%
            }
        %>
    </ul>
</div>
<div class="container">
    <h1 class="text-center mb-4">Movies</h1>

    <div class="row">
        <!-- Movies Section -->
        <div class="col-md-12">
            <div class="row">
                <%
                    MovieRepo movieRepo = new MovieRepo();
                    List<Movie> movies = movieRepo.findAll();
                    for (Movie movie : movies) {
                        if (filmGenre != null && !filmGenre.equals("all")) {
                            if (movie.getGenre().equals(filmGenre)) {
                %>
                <div class="col-md-4 movie-card">
                    <div class="card">
                        <img src="/file/<%=movie.getId()%>" class="card-img-top" alt="Movie Poster">
                        <div class="card-body">
                            <h5 class="card-title"><%=movie.getName()%></h5>
                            <p class="card-text">Genre: <%=movie.getGenre()%></p>
                            <a href="/session?movieId=<%=movie.getId()%>" class="btn btn-primary">Show</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {
                %>
                <div class="col-md-4 movie-card">
                    <div class="card">
                        <img src="/file/<%=movie.getId()%>" class="card-img-top" alt="Movie Poster">
                        <div class="card-body">
                            <h5 class="card-title"><%=movie.getName()%></h5>
                            <p class="card-text">Genre: <%=movie.getGenre()%></p>
                            <a href="/session?movieId=<%=movie.getId()%>" class="btn btn-primary">Show</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
