package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Ticket  extends BaseEntity{
    @ManyToOne
    private Seat seat;
    @ManyToOne
    private Users user;
}
