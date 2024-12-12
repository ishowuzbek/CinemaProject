<%@ page import="org.example.cinemaproject.entity.Session" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Session Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .session-container {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .session-header {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .room-info {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .room-info p {
            margin: 0;
        }
        .btn-show {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-show:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<%
    List<Session> sessions = (List<Session>) request.getAttribute("sessions");
   Integer movieId=Integer.parseInt(request.getParameter("movieId"));
%>
<div class="container my-4">
    <h1 class="text-center">Movie Sessions</h1>

    <%
        if (sessions != null) {
            String currentStartTime = null;
            for (Session session1 : sessions) {
                String startTime = session1.getStartDate().toString();
                String endTime = session1.getEndDate().toString();
                String roomNumber = session1.getRoom().getRoomNumber().toString();
                int price = session1.getPrice();

                if (!startTime.equals(currentStartTime)) {
    %>
    <div class="session-container">
        <div class="session-header"><%= startTime %> - <%= endTime %></div>
        <%
                currentStartTime = startTime;
            }
        %>

        <div class="room-info">
            <p>Room <%= roomNumber %> - Price: <%= price %> | Left: full</p>
            <form action="booking.jsp">
                <input type="hidden" name="movieId" value="<%=movieId%>">
                <input type="hidden" name="startTime" value="<%=startTime%>">
                <input type="hidden" name="endTime" value="<%=endTime%>">
                <input type="hidden" name="price" value="<%=price%>">
                <input type="hidden" name="sessionId" value="<%=session1.getId()%>">
                <button class="btn btn-show">Show</button>
            </form>
        </div>

        <%
            if (!endTime.equals(currentStartTime)) {
        %>
    </div>
    <%
                }
            }
        }
    %>
</div>
</body>
</html>
