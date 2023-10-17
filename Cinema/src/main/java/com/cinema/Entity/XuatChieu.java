package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "XuatChieu")
public class XuatChieu implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Stt")
    private Integer Stt;
    @Column(name = "GiaXuatChieu")
    private Float GiaXuatChieu;
//    @Column(name = "ngay")
//    private Integer ngay;
//    private String maPhong;
//    private String maPhim;
    @ManyToOne
    @JoinColumn(name = "Ngay")
    private NgayChieu Ngay;
    @ManyToOne
    @JoinColumn(name = "MaPhong")
    private PhongChieu MaPhong;
    @ManyToOne
    @JoinColumn(name = "MaPhim")
    private Phim phim;
}
