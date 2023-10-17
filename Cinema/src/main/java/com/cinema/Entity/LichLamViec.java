package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "LichLamViec")
public class LichLamViec implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_LLV")
    private Integer ID_LLV;
    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLam")
    private Date ngayLam = new Date();

    @Column(name = "ThoiGianBatDau")
    private Time thoiGianBatDau;
    @Column(name = "thoiGianKetThuc")
    private Time thoiGianKetThuc;
    @Column(name = "LuongCoBan")
    private Float luongCoBan;
    @ManyToOne
    @JoinColumn(name = "MaNV")
    private NhanVien nhanVien;
    @ManyToOne
    @JoinColumn(name = "MaCN")
    private ChiNhanh chiNhanh;
}
