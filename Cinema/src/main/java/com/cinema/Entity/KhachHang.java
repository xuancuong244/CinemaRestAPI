package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "KHACHHANG")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "KHACHHANG")
public class KhachHang {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MAKH")
    private Integer maKH;
    @Column(name = "TENKH")
    private String tenKH;
    @Column(name = "MATKHAU")
    private String matKhau;
    @Column(name = "EMAIL")
    private String email;
    @Column(name = "SODT")
    private String soDT;
    @Column(name = "DIACHI")
    private String diaChi;
    @Column(name = "GIOITINH")
    private Boolean gioiTinh;
    @Column(name = "IDFACEBOOK")
    private String idFacebook;
    @Column(name = "HINHFACEBOOK")
    private String hinhFacebook;
    @JsonIgnore
    @OneToMany(mappedBy = "khachHang")
    private List<Ve> veList;
}
