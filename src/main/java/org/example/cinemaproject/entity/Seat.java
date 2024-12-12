package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@ToString
public class Seat extends BaseEntity {
    private int seatNo;
    private String seatStatus;
    @ManyToOne
    private Session session;
}
