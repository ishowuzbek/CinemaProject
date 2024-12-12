package org.example.cinemaproject.servlets;

import org.example.cinemaproject.entity.Movie;
import org.example.cinemaproject.repos.MovieRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.UUID;

@WebServlet("/movie/add")
@MultipartConfig
public class AddMovieServlet extends HttpServlet {
    String absolutePath = "D:/javanew/CinemaProject/files/";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part part = req.getPart("movieImage");
        byte[] bytes = part.getInputStream().readAllBytes();
        Path path = Files.write(Path.of(absolutePath + UUID.randomUUID() + ".jpg"),bytes);
        String name = req.getParameter("movieTitle");
        int year = Integer.parseInt(req.getParameter("movieYear"));
        String genre = req.getParameter("movieGenre");
        String photoUrl = path.toString();
        System.out.println(photoUrl);
        MovieRepo movieRepo = new MovieRepo();
        Movie movie = new Movie(name, year, genre, photoUrl);
        movieRepo.save(movie);
        resp.sendRedirect("/admin");
    }
}
