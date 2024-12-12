package org.example.cinemaproject.entity;

import jakarta.persistence.Entity;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
public class Users extends  BaseEntity{
    private String name;
    private String password;
    private String role="user";

    public Users(Integer id) {
        super(id);
    }

    public Users(String name, String password) {
        this.name = name;
        this.password = password;
    }
}
