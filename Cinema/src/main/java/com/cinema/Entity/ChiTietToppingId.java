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
    @Column(name = "IdVe")
    private int idVe;

    @Column(name = "MaTopping")
    private String maTopping;
}
