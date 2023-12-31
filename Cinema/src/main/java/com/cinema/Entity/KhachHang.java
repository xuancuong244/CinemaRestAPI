package com.cinema.Entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

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
