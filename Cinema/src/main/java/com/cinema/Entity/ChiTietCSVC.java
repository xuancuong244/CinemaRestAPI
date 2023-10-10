package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChiTietCSVC")
public class ChiTietCSVC implements Serializable {
    @Id
    private String maCSVC;
    @Id
    private String maPhong;
    private Integer soLuong;
    @ManyToOne
    @JoinColumn(name = "chieuId")
    private PhongChieu chieu;
    @ManyToOne
    @JoinColumn(name = "csvcId")
    private CSVC csvc;
}
