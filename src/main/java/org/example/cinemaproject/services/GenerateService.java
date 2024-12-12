package org.example.cinemaproject.services;

import jakarta.persistence.EntityManager;
import org.example.cinemaproject.entity.*;
import org.example.cinemaproject.repos.*;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.time.LocalTime;
import java.util.List;

import static org.example.cinemaproject.MyListener.EMF;

@WebListener
public class GenerateService implements ServletContextListener {
    private final MovieRepo movieRepo = new MovieRepo();
    private final GenreRepo genreRepo = new GenreRepo();
    private final RoomRepo roomRepo = new RoomRepo();
    private final UserRepo userRepo = new UserRepo();
    private final SessionRepo sessionRepo = new SessionRepo();

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        init();
    }

    public void init() {
        List<Movie> movies = movieRepo.findAll();
        List<Genre> genres = genreRepo.findAll();
        List<Room> rooms = roomRepo.findAll();
        List<Users> users = userRepo.findAll();
        List<Session> sessions = sessionRepo.findAll();

        if (movies.isEmpty()) {
            Movie movie1 = new Movie();
            movie1.setGenre("Sci-fi");
            movie1.setName("Interstellar");
            movie1.setYear(2014);
            movie1.setPhotoUrl("D:/javanew/CinemaProject/files/interstellar.jpg");
            Movie movie2 = new Movie();
            movie2.setGenre("Comedy/Romance");
            movie2.setName("Forrest Gump");
            movie2.setYear(1994);
            movie2.setPhotoUrl("D:/javanew/CinemaProject/files/ForrestGump.jpg");
            Movie movie3 = new Movie();
            movie3.setGenre("Action/Sci-fi");
            movie3.setName("Inception");
            movie3.setYear(2010);
            movie3.setPhotoUrl("D:/javanew/CinemaProject/files/inception.jpg");
            Movie movie4 = new Movie();
            movie4.setGenre("Thriller/Comedy");
            movie4.setName("Parasite");
            movie4.setYear(2019);
            movie4.setPhotoUrl("D:/javanew/CinemaProject/files/parasite.jpg");
            movieRepo.save(movie1);
            movieRepo.save(movie2);
            movieRepo.save(movie3);
            movieRepo.save(movie4);
        }else{
            System.out.println("There are movies in the database");
        }
        if (genres.isEmpty()) {
            Genre genre1 = new Genre();
            genre1.setName("Sci-fi");
            Genre genre2 = new Genre();
            genre2.setName("Action");
            Genre genre3 = new Genre();
            genre3.setName("Comedy/Romance");
            Genre genre4 = new Genre();
            genre4.setName("Action/Sci-fi");
            Genre genre5 = new Genre();
            genre5.setName("Thriller/Comedy");
            Genre genre6 = new Genre();
            genre6.setName("Comedy");
            Genre genre7 = new Genre();
            genre7.setName("Drama");
            Genre genre8 = new Genre();
            genre8.setName("Detective");
            genreRepo.save(genre1);
            genreRepo.save(genre2);
            genreRepo.save(genre3);
            genreRepo.save(genre4);
            genreRepo.save(genre5);
            genreRepo.save(genre6);
            genreRepo.save(genre7);
            genreRepo.save(genre8);
        }else {
            System.out.println("There are genres in the database");
        }
        if (rooms.isEmpty()) {
            Room room1 = new Room();
            room1.setRoomNumber(1);
            room1.setCapacity(30);
            Room room2 = new Room();
            room2.setRoomNumber(2);
            room2.setCapacity(30);
            Room room3 = new Room();
            room3.setRoomNumber(3);
            room3.setCapacity(30);
            Room room4 = new Room();
            room4.setRoomNumber(4);
            room4.setCapacity(30);
            roomRepo.save(room1);
            roomRepo.save(room2);
            roomRepo.save(room3);
            roomRepo.save(room4);
        }else {
            System.out.println("There are rooms in the database");
        }
        if (users.isEmpty()){
            Users user1 = new Users();
            user1.setName("Samandar");
            user1.setPassword("123456");
            user1.setRole("user");
            Users user2 = new Users();
            user2.setName("Elshod");
            user2.setPassword("123");
            user2.setRole("user");
            Users user3 = new Users();
            user3.setName("Muhammadamin");
            user3.setPassword("admin123");
            user3.setRole("admin");
            userRepo.save(user1);
            userRepo.save(user2);
            userRepo.save(user3);
        }else {
            System.out.println("There are users in the database");
        }
//        if (sessions.isEmpty()){
//            EntityManager entityManager = EMF.createEntityManager();
//            Movie movie = entityManager.find(Movie.class, 1);
//            Room room = entityManager.find(Room.class, 1);
//            Session session1 = new Session();
//            session1.setMovie(movie);
//            session1.setRoom(room);
//            session1.setPrice(20000);
//            session1.setStartDate(LocalTime.of(20, 0));
//            session1.setEndDate(LocalTime.of(22, 0));
//
//            Movie movie1 = entityManager.find(Movie.class, 2);
//            Room room1 = entityManager.find(Room.class, 2);
//            Session session2 = new Session();
//            session2.setMovie(movie1);
//            session2.setRoom(room1);
//            session2.setPrice(25000);
//            session2.setStartDate(LocalTime.of(18, 0));
//            session2.setEndDate(LocalTime.of(20, 0));
//
//            Movie movie2 = entityManager.find(Movie.class, 3);
//            Room room2 = entityManager.find(Room.class, 3);
//            Session session3 = new Session();
//            session3.setMovie(movie2);
//            session3.setRoom(room2);
//            session3.setPrice(15000);
//            session3.setStartDate(LocalTime.of(14, 0));
//            session3.setEndDate(LocalTime.of(16, 0));
//
//            Movie movie3 = entityManager.find(Movie.class, 4);
//            Room room3 = entityManager.find(Room.class, 4);
//            Session session4 = new Session();
//            session4.setMovie(movie3);
//            session4.setRoom(room3);
//            session4.setPrice(30000);
//            session4.setStartDate(LocalTime.of(19, 0));
//            session4.setEndDate(LocalTime.of(21, 0));
//        }

    }
}
