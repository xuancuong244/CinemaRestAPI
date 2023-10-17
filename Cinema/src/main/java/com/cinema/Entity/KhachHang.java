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
@Table(name = "KhachHang")
public class KhachHang implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "maKH")
    private Integer maKH;
    @Column(name = "tenKH")
    private String tenKH;
    @Column(name = "matKhau")
    private String matKhau;
    @Column(name = "email")
    private String email;
    @Column(name = "soDT")
    private String soDT;
    @Column(name = "diaChi")
    private String diaChi;
    @Column(name = "gioiTinh")
    private Boolean gioiTinh;
    @Column(name = "idFacebook")
    private String idFacebook;
    @Column(name = "hinhFacabook")
    private String hinhFacebook;
    @JsonIgnore
    @OneToMany(mappedBy = "khachHang")
    private List<Ve> veList;
}
