package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CT_CSVC")
public class ChiTietCSVC implements Serializable {
    @Id
    @Column(name = "maCSVC")
    private String maCSVC;

    @Id
    @Column(name = "maPhong")
    private String maPhong;

    @Column(name = "soLuong")
    private Integer soLuong;

    @ManyToOne
    @JoinColumn(name = "chieuId")
    private PhongChieu chieu;

    @ManyToOne
    @JoinColumn(name = "csvcId")
    private CSVC csvc;
}
