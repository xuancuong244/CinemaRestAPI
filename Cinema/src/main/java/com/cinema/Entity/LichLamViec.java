package com.cinema.Entity;

import java.sql.Time;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "LICHLAMVIEC")
public class LichLamViec {
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
