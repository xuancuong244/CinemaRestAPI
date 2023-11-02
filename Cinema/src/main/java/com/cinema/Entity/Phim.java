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
@Table(name = "phim")
public class Phim {
	@Id
    @Column(name = "ma_phim")
    private String maPhim;
    @Column(name = "ten_phim")
    private String tenPhim;
    @Column(name = "dien_vien")
    private String dienVien;
    @Column(name = "namsx")
    private Integer namSX;
    @Column(name = "hinh")
    private String hinh;
    @Column(name = "dao_dien")
    private String daoDien;
    @Column(name = "quoc_gia")
    private String quocGia;
    @Column(name = "thoi_luong")
    private String thoiLuong;
    @Column(name = "mo_ta")
    private String moTa;
    @Column(name = "trailer")
    private String trailer;
    @Column(name = "trang_thai")
    private String trangThai;
}
