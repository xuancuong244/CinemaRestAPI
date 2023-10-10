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
    private Integer id;
    @Temporal(TemporalType.DATE)
    @Column(name = "NgayLam")
    private Date ngayLam = new Date();
    private Time thoiGianBatDau;
    private Time thoiGianKetThuc;
    private Float luongCoBan;
    @ManyToOne
    @JoinColumn(name = "nhanVienId")
    private NhanVien nhanVien;
    @ManyToOne
    @JoinColumn(name = "chiNhanhId")
    private ChiNhanh chiNhanh;
}
