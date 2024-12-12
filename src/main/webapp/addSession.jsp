<%@ page import="org.example.cinemaproject.repos.MovieRepo" %>
<%@ page import="org.example.cinemaproject.entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.cinemaproject.repos.RoomRepo" %>
<%@ page import="org.example.cinemaproject.entity.Room" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/9/2024
  Time: 4:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Session</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar {
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            background-color: #343a40;
            color: #fff;
        }
        .sidebar a {
            color: #fff;
            text-decoration: none;
            padding: 10px 15px;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
    </style>
</head>
<body>
<!-- Sidebar -->
<div class="sidebar">
    <h2 class="text-center py-3">Admin Panel</h2>
    <a href="admin.jsp">Dashboard</a>
    <a href="addMovies.jsp">Add Movies</a>
    <a href="addSession.jsp" class="active">Add Session</a>
</div>

<!-- Content -->
<div class="content">
    <h1>Add Session</h1>
    <form action="/session/add" method="post">
        <!-- Movie Name -->
        <div class="mb-3">
            <label for="movieName" class="form-label">Movie Name</label>
            <select class="form-select" id="movieName" name="movieId">
                <option selected>Select a movie</option>
                 <%
                    MovieRepo movieRepo=new MovieRepo();
                    List<Movie> movies = movieRepo.findAll();
                    for (Movie movie : movies) {
                        %>
                <option value="<%=movie.getId()%>"><%=movie.getName()%></option>
                <%
                    }
                %>
            </select>
        </div>

        <!-- Start Time -->
        <div class="mb-3">
            <label for="startTime" class="form-label">Start Time</label>
            <input name="startTime" type="time" class="form-control" id="startTime">
        </div>

        <!-- End Time -->
        <div class="mb-3">
            <label for="endTime" class="form-label">End Time</label>
            <input name="endTime" type="time" class="form-control" id="endTime">
        </div>

        <!-- Room Number -->
        <div class="mb-3">
            <label for="roomNumber" class="form-label">Room Number</label>
            <select class="form-select" id="roomNumber" name="roomId">
                <option selected>Select a room</option>
                <%
                    RoomRepo roomRepo= new RoomRepo();
                    List<Room> rooms = roomRepo.findAll();
                    for (Room room : rooms) {
                        %>
                <option value="<%=room.getId()%>">Room <%=room.getRoomNumber()%></option>
                <%
                    }
                %>
            </select>
        </div>

        <!-- Price -->
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input name="price" type="number" class="form-control" id="price" placeholder="Enter price">
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-success">Add Session</button>
    </form>
</div>
</body>
</html>
