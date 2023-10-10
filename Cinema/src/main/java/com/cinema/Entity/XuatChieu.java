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
    private Integer id;
    private Float giaXuatChieu;
    private Integer ngay;
    private String maPhong;
    private String maPhim;
    @ManyToOne
    @JoinColumn(name = "ngayChieuId")
    private NgayChieu ngayChieu;
    @ManyToOne
    @JoinColumn(name = "phongChieuId")
    private PhongChieu phongChieu;
    @ManyToOne
    @JoinColumn(name = "phimmId")
    private Phim phimm;
}
