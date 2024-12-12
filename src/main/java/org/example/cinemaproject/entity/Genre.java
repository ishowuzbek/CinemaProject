package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Genre extends BaseEntity {
    private String name;
}
