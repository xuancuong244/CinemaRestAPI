package com.cinema.Entity;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "nhan_vien")
public class NhanVien {
	@Id
    @Column(name = "Ma_NV")
    private String maNV;
    @Column(name = "Ho_Ten")
    private String hoTen;
    @Column(name = "email",unique = true)
    private String email;
    @Column(name = "Gioi_Tinh")
    private Boolean GioiTinh;
    @Column(name = "Mat_Khau")
    private String matKhau;
    @Column(name = "Ngay_Sinh")
    private Date ngaySinh;
    @Column(name = "So_DT")
        private String soDT;
    @ManyToOne
    @JoinColumn(name = "Ma_CV")
    private ChucVu chucVu;
}
