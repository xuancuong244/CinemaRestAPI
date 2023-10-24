package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "PHONGCHIEU")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "PHONGCHIEU")
public class PhongChieu {
	@Id
    @Column(name = "maPhong")
    private String maPhong;
    @Column(name = "tenPhong")
    private String tenPhong;

    @ManyToOne
    @JoinColumn(name = "maCN")
    private ChiNhanh nhanh;
    @JsonIgnore
    @OneToMany(mappedBy = "phongChieu")
    private List<ChiTietGhe> chiTietGheList;
    @JsonIgnore
    @OneToMany(mappedBy = "chieu")
    private List<ChiTietCSVC> chiTietCSVCList;
    @JsonIgnore
    @OneToMany(mappedBy = "MaPhong")
    private List<XuatChieu> xuatChieu;
}
