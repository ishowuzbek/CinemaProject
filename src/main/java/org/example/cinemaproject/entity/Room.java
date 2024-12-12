package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Entity
@ToString
public class Room  extends BaseEntity{
    private Integer roomNumber;
    private int capacity;
}
