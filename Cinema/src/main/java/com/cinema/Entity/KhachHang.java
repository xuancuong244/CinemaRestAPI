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
@Table(name = "khach_hang")
public class KhachHang {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Ma_KH")
    private Integer maKH;
    @Column(name = "Ten_KH")
    private String tenKH;
    @Column(name = "Mat_Khau")
    private String matKhau;
    @Column(name = "email",unique = true)
    private String email;
    @Column(name = "sodt")
    private String soDT;
    @Column(name = "Dia_Chi")
    private String diaChi;
    @Column(name = "Gioi_Tinh")
    private Boolean gioiTinh;
    @Column(name = "Id_FB")
    private String idFB;
    @Column(name = "Hinh_FB")
    private String hinhFB;
}
