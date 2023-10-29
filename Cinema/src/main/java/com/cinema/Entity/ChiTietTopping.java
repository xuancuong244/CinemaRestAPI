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
@Table(name = "chi_tiet_topping")
public class ChiTietTopping {
    @EmbeddedId
    private ChiTietToppingId id;

    @Column(name = "So_Luong_Mua")
    private int soLuongMua;

    @ManyToOne
    @MapsId("id_Ve")
    @JoinColumn(name = "Id_Ve")
    private Ve ve;

    @ManyToOne
    @MapsId("ma_Topping")
    @JoinColumn(name = "Ma_Topping")
    private OrderTopping topping;
}
