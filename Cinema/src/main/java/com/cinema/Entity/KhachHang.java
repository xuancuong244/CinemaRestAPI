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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "KhachHang")
public class KhachHang {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaKH")
    private Integer maKH;
    @Column(name = "TenKH")
    private String tenKH;
    @Column(name = "MatKhau")
    private String matKhau;
    @Column(name = "Email",unique = true)
    private String email;
    @Column(name = "SoDT")
    private String soDT;
    @Column(name = "DiaChi")
    private String diaChi;
    @Column(name = "GioiTinh")
    private Boolean gioiTinh;
    @Column(name = "IdFB")
    private String idFB;
    @Column(name = "HinhFB")
    private String hinhFB;
}
