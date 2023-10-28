package com.cinema.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChiTietToppingId implements Serializable {
    @Column(name = "Id_Ve")
    private int idVe;

    @Column(name = "Ma_Topping")
    private String maTopping;
}
