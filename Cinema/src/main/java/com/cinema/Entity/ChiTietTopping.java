package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chi_tiet_topping")
@IdClass(ChiTietToppingId.class)
public class ChiTietTopping {
    @Id
    @Column(name = "Id_Ve")
    private Integer id;

    @Id
    @Column(name = "Ma_Topping")
    private String maTopping;

    @Column(name = "so_luong_mua")
    private Integer soLuongMua;

    @ManyToOne
    @JoinColumn(name = "Id_Ve", insertable = false, updatable = false)
    private Ve ve;

    @ManyToOne
    @JoinColumn(name = "Ma_Topping", insertable = false, updatable = false)
    private OrderTopping topping;
}
