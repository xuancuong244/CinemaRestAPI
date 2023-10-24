package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "PHIM")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "PHIM")
public class Phim {
	@Id
    private String maPhim;
    private String tenPhim;
    private String dienVien;
    private Integer namSX;
    private String hinh;
    private String daoDien;
    private String quocGia;
    private String thoiLuong;
    private String moTa;
    private String trailer;
    @JsonIgnore
    @OneToMany(mappedBy = "phim")
    private List<ChiTietPhim> chiTietPhimList;
    @JsonIgnore
    @OneToMany(mappedBy = "phimm")
    private List<XuatChieu> chieuList;
}
