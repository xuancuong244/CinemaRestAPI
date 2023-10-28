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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "lich_lam_viec")
public class LichLamViec {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_LLV")
    private Integer idLLV;
    @Temporal(TemporalType.DATE)
    @Column(name = "Ngay_Lam")
    private Date ngayLam = new Date();

    @Column(name = "Thoi_Gian_Bat_Dau")
    private Time thoiGianBatDau;
    @Column(name = "Thoi_Gian_Ket_Thuc")
    private Time thoiGianKetThuc;
    @Column(name = "Luong_Co_Ban")
    private Float luongCoBan;
    @ManyToOne
    @JoinColumn(name = "Ma_NV")
    private NhanVien nhanVien;
    @ManyToOne
    @JoinColumn(name = "Ma_CN")
    private ChiNhanh chiNhanh;
}
