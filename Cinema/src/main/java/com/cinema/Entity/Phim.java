package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Phim")
public class Phim implements Serializable {
    @Id
    @Column(name = "MaPhim")
    private String maPhim;
    @Column(name = "TenPhim")
    private String tenPhim;
    @Column(name = "DienVien")
    private String dienVien;
    @Column(name = "NamSX")
    private Integer NamSX;
    @Column(name = "hinh")
    private String hinh;
    @Column(name = "daoDien")
    private String daoDien;
    @Column(name = "quocGia")
    private String quocGia;
    @Column(name = "thoiLuong")
    private String thoiLuong;
    @Column(name = "moTa")
    private String moTa;
    @Column(name = "trailer")
    private String trailer;
    @JsonIgnore
    @OneToMany(mappedBy = "phim")
    private List<ChiTietPhim> chiTietPhimList;
    @JsonIgnore
    @OneToMany(mappedBy = "phimm")
    private List<XuatChieu> chieuList;
}
