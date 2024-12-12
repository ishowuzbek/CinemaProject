<%@ page import="static org.example.cinemaproject.MyListener.EMF" %>
<%@ page import="jakarta.persistence.EntityManager" %>
<%@ page import="org.example.cinemaproject.entity.Movie" %>
<%@ page import="org.example.cinemaproject.entity.Users" %>
<%@ page import="org.example.cinemaproject.repos.SeatRepo" %>
<%@ page import="org.example.cinemaproject.entity.Seat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="java.util.Set" %>
<%@ page import="lombok.val" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 12/10/2024
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .seat.sold {
            background-color: #6c757d;
            cursor: not-allowed;
            color: white;
            text-align: center;
            line-height: 40px;
            font-weight: bold;
        }

        .movie-container {
            text-align: center;
            margin-top: 20px;
        }

        .movie-poster {
            width: 100%;
            max-width: 300px;
            margin: 0 auto;
            border-radius: 10px;
        }

        .seat-container {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            gap: 10px;
            max-width: 500px;
            margin: 20px auto;
        }

        .seat {
            width: 40px;
            height: 40px;
            background-color: #28a745;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="checkbox"] {
            display: none;
        }

        input[type="checkbox"]:checked + .seat {
            background-color: #dc3545;
        }

        .price {
            font-size: 1.2rem;
            font-weight: bold;
            margin-top: 10px;
            color: #555;
        }

        .btn-book {
            display: block;
            margin: 20px auto;
            width: fit-content;
        }
    </style>
</head>
<%
    int sessionId = Integer.parseInt(request.getParameter("sessionId"));
    Users user = (Users) session.getAttribute("user");
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");
    int price = Integer.parseInt(request.getParameter("price"));
    EntityManager entityManager = EMF.createEntityManager();
    Movie movie = entityManager.find(Movie.class, movieId);
%>
<body>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        let checkboxes = document.querySelectorAll('input.seat-checkbox');
        let totalPriceElement = document.getElementById('totalPrice');
        let seatPrice = parseInt("<%=price%>", 10);


        function updateTotalPrice() {
            let totalSelectedSeats = 0;

            console.log("Checkboxes:", checkboxes);
            console.log("Seat Price:", seatPrice);

            checkboxes.forEach(checkbox => {
                if (checkbox.checked) {
                    totalSelectedSeats++;
                }
            });

            console.log("Total Selected Seats:", totalSelectedSeats);

            let total = totalSelectedSeats * seatPrice;
            console.log("Total:", total);

            if (totalPriceElement) {
                totalPriceElement.textContent = `Total: `+total+` so'm `;
            } else {
                console.error("Total Price Element not found!");
            }
        }


        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', updateTotalPrice);
        });

        updateTotalPrice();
    });
</script>

<div class="container">
    <div class="movie-container">
        <img src="/file/<%=movie.getId()%>" class="card-img-top" alt="Movie Poster" class="movie-poster"
             style="height: 400px; width: 400px">
        <h3>Time: <%=startTime%> - <%=endTime%>
        </h3>
        <h4>Movie: <%=movie.getName()%>
        </h4>
        <p class="price">Price per seat: <%=price%> so'm</p>
    </div>

    <form action="/booking" method="post">
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <input type="hidden" name="movieId" value="<%=movieId%>">
        <input type="hidden" name="startTime" value="<%=startTime%>">
        <input type="hidden" name="endTime" value="<%=endTime%>">
        <input type="hidden" name="price" value="<%=price%>">
        <input type="hidden" name="sessionId" value="<%=sessionId%>">

        <div class="seat-container">
            <%
                SeatRepo seatRepo = new SeatRepo();
                List<Seat> soldSeats = seatRepo.findBySessionId(sessionId);
                System.out.println("AAA"+soldSeats);
                Set<Integer> soldSeatNumbers = new HashSet<>();
                if (soldSeats != null) {
                    for (Seat seat : soldSeats) {
                        soldSeatNumbers.add(seat.getSeatNo());
                    }
                }

                int totalSeats = 30;
                for (int i = 1; i <= totalSeats; i++) {
                    boolean isSold = soldSeatNumbers.contains(i);
            %>
            <label>
                <input type="checkbox" class="seat-checkbox" name="selectedSeats" value="<%=i%>"
                        <%= isSold ? "disabled" : "" %> />
                <div class="seat <%= isSold ? "sold" : "" %>"><%= isSold ? "SOLD" : i %></div>
            </label>
            <%
                }
            %>
        </div>




        <p class="price" id="totalPrice">Total: so'm </p>

        <button type="submit" class="btn btn-primary btn-book">Buy Ticket</button>
    </form>

</div>

</body>
</html>
