package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "NhanVien")
public class NhanVien implements Serializable {
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
