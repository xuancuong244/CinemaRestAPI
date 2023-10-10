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
    private Integer maKH;
    private String tenKH;
    private String matKhau;
    private String email;
    private String soDT;
    private String diaChi;
    private Boolean gioiTinh;
    private String idFacebook;
    private String hinhFacebook;
    @JsonIgnore
    @OneToMany(mappedBy = "khachHang")
    private List<Ve> veList;
}
