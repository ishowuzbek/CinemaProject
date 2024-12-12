package org.example.cinemaproject.repos;

import jakarta.persistence.EntityManager;
import org.example.cinemaproject.entity.Seat;

import java.util.List;

import static org.example.cinemaproject.MyListener.EMF;

public class SeatRepo  extends BaseRepo<Seat> {
    public List<Seat> findBySessionId(int sessionId) {
        EntityManager entityManager = EMF.createEntityManager();
        try {
            return entityManager.createQuery(
                            "SELECT s FROM Seat s WHERE s.session.id = :sessionId AND s.seatStatus = 'sold'", Seat.class)
                    .setParameter("sessionId", sessionId)
                    .getResultList();
        } finally {
            entityManager.close();
        }
    }

    public boolean isSeatSold(int sessionId, int seatNo) {
        EntityManager entityManager = EMF.createEntityManager();
        try {
            Long count = entityManager.createQuery(
                            "SELECT COUNT(s) FROM Seat s WHERE s.session.id = :sessionId AND s.seatNo = :seatNo AND s.seatStatus = 'sold'", Long.class)
                    .setParameter("sessionId", sessionId)
                    .setParameter("seatNo", seatNo)
                    .getSingleResult();
            return count > 0;
        } finally {
            entityManager.close();
        }
    }


}
