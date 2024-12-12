package org.example.cinemaproject.servlets;

import org.example.cinemaproject.entity.Movie;
import org.example.cinemaproject.repos.MovieRepo;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@WebServlet("/file/*")
@MultipartConfig
public class FileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        int movieId = Integer.parseInt(pathInfo.split("/")[1]);
        MovieRepo movieRepo = new MovieRepo();
        List<Movie> movies =movieRepo.findAll();
        Movie film = movies.stream().filter(movie -> movie.getId() == movieId).findFirst().orElseThrow();
        resp.getOutputStream().write(Files.readAllBytes(Path.of(film.getPhotoUrl())));

    }
}
