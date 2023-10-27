package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "Ve")
public class Ve {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdVe")
    private Integer idVe;
    @Column(name = "TongGiaVe")
    private Float tongGiaVe;
    @Column(name = "ThueVAT")
    private Float thueVAT;
    @ManyToOne
    @JoinColumn(name = "MaKH")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "MaCTGhe")
    private ChiTietGhe chiTietGhe;

    @ManyToOne
    @JoinColumn(name = "Stt_XC")
    private XuatChieu xuatChieu;
}
