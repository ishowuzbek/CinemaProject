package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;

import java.time.LocalTime;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@ToString
public class Session extends BaseEntity {
    @ManyToOne
    private Room room;
    private LocalTime startDate;
    private LocalTime endDate;
    private Integer price;
    @ManyToOne
    private Movie movie;

}
