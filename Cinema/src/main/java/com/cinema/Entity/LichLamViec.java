package com.cinema.Entity;

import java.sql.Time;
import java.util.Date;

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
