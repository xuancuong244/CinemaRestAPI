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
    private Integer idVe;
    @Id
    private String maTopping;
    private Integer soLuongMua;
    @ManyToOne
    @JoinColumn(name = "toppingId")
    private OrderTopping topping;
    @ManyToOne
    @JoinColumn(name = "veeId")
    private Ve vee;
}
