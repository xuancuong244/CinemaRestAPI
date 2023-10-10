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
@Table(name = "PhongChieu")
public class PhongChieu implements Serializable {
    @Id
    private String maPhong;
    private String tenPhong;
    private String maCN;
    @ManyToOne
    @JoinColumn(name = "chiNhanhId")
    private ChiNhanh nhanh;
    @JsonIgnore
    @OneToMany(mappedBy = "phongChieu")
    private List<ChiTietGhe> chiTietGheList;
    @JsonIgnore
    @OneToMany(mappedBy = "chieu")
    private List<ChiTietCSVC> chiTietCSVCList;
    @JsonIgnore
    @OneToMany(mappedBy = "phongChieu")
    private List<XuatChieu> xuatChieu;
}
