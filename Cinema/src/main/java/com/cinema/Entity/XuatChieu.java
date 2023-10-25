package com.cinema.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "XUATCHIEU")
public class XuatChieu {
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
    @JoinColumn(name = "maPhong")
    private PhongChieu MaPhong;
    @ManyToOne
    @JoinColumn(name = "maPhim")
    private Phim phimm;
}
