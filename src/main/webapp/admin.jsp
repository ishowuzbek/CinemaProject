<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/9/2024
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Panel</title>
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
<div class="sidebar">
    <h2 class="text-center py-3">Admin Panel</h2>
    <a href="admin.jsp">Dashboard</a>
    <a href="addMovies.jsp">Add Movies</a>
    <a href="addSession.jsp">Add Session</a>
</div>

<div class="content">
    <h1>Welcome to the Admin Panel</h1>
    <p>Select an option from the sidebar to manage your content.</p>
</div>

</body>
</html>
