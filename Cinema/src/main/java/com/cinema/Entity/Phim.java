package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "Phim")
public class Phim {
	@Id
    @Column(name = "MaPhim")
    private String maPhim;
    @Column(name = "TenPhim")
    private String tenPhim;
    @Column(name = "DienVien")
    private String dienVien;
    @Column(name = "NamSX")
    private Integer namSX;
    @Column(name = "Hinh")
    private String hinh;
    @Column(name = "DaoDien")
    private String daoDien;
    @Column(name = "QuocGia")
    private String quocGia;
    @Column(name = "ThoiLuong")
    private String thoiLuong;
    @Column(name = "MoTa")
    private String moTa;
    @Column(name = "Trailer")
    private String trailer;
}
