<%@ page import="org.example.cinemaproject.repos.GenreRepo" %>
<%@ page import="org.example.cinemaproject.entity.Genre" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/9/2024
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Movies</title>
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
    <a href="addMovies.html" class="active">Add Movies</a>
    <a href="addSession.jsp">Add Session</a>
</div>
<div class="content">
    <h1>Add Movies</h1>
    <form action="/movie/add" method="post" enctype="multipart/form-data">
        <!-- Movie Title -->
        <div class="mb-3">
            <label for="movieTitle" class="form-label">Movie Title</label>
            <input  name="movieTitle" type="text" class="form-control" id="movieTitle" placeholder="Enter movie title">
        </div>

        <!-- Movie Year -->
        <div class="mb-3">
            <label for="movieYear" class="form-label">Release Year</label>
            <input name="movieYear" type="number" class="form-control" id="movieYear" placeholder="Enter release year">
        </div>

        <!-- Movie Image -->
        <div class="mb-3">
            <label for="movieImage" class="form-label">Movie Image</label>
            <input  name="movieImage" type="file" class="form-control" id="movieImage" accept="image/*">
        </div>

        <!-- Movie Genre -->
        <div class="mb-3">
            <label for="movieGenre" class="form-label">Genre</label>
            <select class="form-select" id="movieGenre" name="movieGenre">
                <option selected>Select genre</option>
                <%
                    GenreRepo genreRepo= new GenreRepo();
                    List<Genre> genres = genreRepo.findAll();
                    for (Genre genre : genres) {
                        %>
                <option value="<%=genre.getName()%>"><%=genre.getName()%></option>
                <%
                    }
                %>
            </select>
        </div>
        <button type="submit" class="btn btn-success">Add Movie</button>
    </form>
</div>
</body>
</html>
