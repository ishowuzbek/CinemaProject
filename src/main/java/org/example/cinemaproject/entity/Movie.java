package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@ToString
public class Movie extends BaseEntity{
    private String name;
    private int year;
    private String genre;
    private String photoUrl;
}
