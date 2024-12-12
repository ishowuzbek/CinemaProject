<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/10/2024
  Time: 11:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>Sign Up</title>
</head>
<body class="bg-light">
<div class="container">
  <div class="row justify-content-center align-items-center vh-100">
    <div class="col-md-4">
      <div class="card shadow-sm">
        <div class="card-header text-center bg-success text-white">
          <h3>Sign Up</h3>
        </div>
        <div class="card-body">
          <form action="/signup" method="post">
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input name="name"
                     type="text"
                     class="form-control"
                     id="name"
                     placeholder="Enter your name" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Password</label>
              <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Sign Up</button>
          </form>
        </div>
        <div class="card-footer text-center">
          <small class="text-muted">
            Already have an account? <a href="/login">Login</a>
          </small>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
