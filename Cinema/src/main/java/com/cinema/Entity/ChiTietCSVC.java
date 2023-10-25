package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CT_CSVC")
public class ChiTietCSVC{
    @Id
    @Column(name = "MACSVC")
    private String maCSVC;

    @Id
    @Column(name = "MAPHONG")
    private String maPhong;

    @Column(name = "SOLUONG")
    private Integer soLuong;

    @ManyToOne
    @JoinColumn(name = "chieuId")
    private PhongChieu chieu;

    @ManyToOne
    @JoinColumn(name = "csvcId")
    private CSVC csvc;
}
