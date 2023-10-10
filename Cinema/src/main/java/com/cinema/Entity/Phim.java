package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
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
    private String maPhim;
    private String tenPhim;
    private String dienVien;
    private Integer namSanXuat;
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
