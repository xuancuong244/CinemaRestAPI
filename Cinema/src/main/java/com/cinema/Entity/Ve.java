package com.cinema.Entity;

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
@Table(name = "ve")
public class Ve {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id_Ve")
    private Integer idVe;
    @Column(name = "Tong_Gia_Ve")
    private Float tongGiaVe;
    @Column(name = "Thue_VAT")
    private Float thueVAT;
    @ManyToOne
    @JoinColumn(name = "Ma_KH")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "Ma_CTGhe")
    private ChiTietGhe chiTietGhe;

    @ManyToOne
    @JoinColumn(name = "Stt_XC")
    private XuatChieu xuatChieu;
}
