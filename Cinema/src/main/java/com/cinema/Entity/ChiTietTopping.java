package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChiTietTopping")
public class ChiTietTopping implements Serializable {
    @Id
    @Column(name = "IdVe")
    private Integer idVe;

    @Id
    @Column(name = "MaTopping")
    private String maTopping;

    @Column(name = "soLuongMua")
    private Integer soLuongMua;

    @ManyToOne
    @JoinColumn(name = "toppingId")
    private OrderTopping topping;

    @ManyToOne
    @JoinColumn(name = "IdVe")
    private Ve ve;
}
