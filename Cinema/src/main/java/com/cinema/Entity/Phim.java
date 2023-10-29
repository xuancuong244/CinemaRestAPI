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
    @Column(name = "Ma_Phim")
    private String maPhim;
    @Column(name = "Ten_Phim")
    private String tenPhim;
    @Column(name = "Dien_Vien")
    private String dienVien;
    @Column(name = "Nam_SX")
    private Integer namSX;
    @Column(name = "Hinh")
    private String hinh;
    @Column(name = "Dao_Dien")
    private String daoDien;
    @Column(name = "Quoc_Gia")
    private String quocGia;
    @Column(name = "Thoi_Luong")
    private String thoiLuong;
    @Column(name = "Mo_Ta")
    private String moTa;
    @Column(name = "Traller")
    private String trailer;
}
