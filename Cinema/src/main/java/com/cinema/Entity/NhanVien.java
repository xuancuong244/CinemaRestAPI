package com.cinema.Entity;

import java.util.Date;
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

@Entity(name = "NHANVIEN")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "NHANVIEN")
public class NhanVien {
	@Id
    @Column(name = "MaNV")
    private String maNV;
    @Column(name = "HoTen")
    private String hoTen;
    @Column(name = "GioiTinh")
    private Integer gioiTinh;
    @Column(name = "MatKhau")
    private String matKhau;
    @Column(name = "NgaySinh")
    private Date ngaySinh;
    @Column(name = "SoDT")
    private String soDT;
    @ManyToOne
    @JoinColumn(name = "MaCV")
    private ChucVu chucVu;
    @JsonIgnore
    @OneToMany(mappedBy = "nhanVien")
    List<LichLamViec> lichLamViecList;
}
