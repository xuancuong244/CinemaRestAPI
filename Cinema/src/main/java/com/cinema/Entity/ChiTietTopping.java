package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "ChiTietTopping")
public class ChiTietTopping {
    @EmbeddedId
    private ChiTietToppingId id;

    @Column(name = "SoLuongMua")
    private int soLuongMua;

    @ManyToOne
    @MapsId("idVe")
    @JoinColumn(name = "IdVe")
    private Ve ve;

    @ManyToOne
    @MapsId("maTopping")
    @JoinColumn(name = "MaTopping")
    private OrderTopping topping;
}
