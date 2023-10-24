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
import lombok.NoArgsConstructor;

@Entity(name = "VE")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "VE")
public class Ve {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdVe")
    private Integer idVe;
    @Column(name = "TongGiaVe")
    private Float tongGiaVe;
    @Column(name = "ThueVAT")
    private Float thueVAT;
//    private Integer maKH;
//    private Integer maCTGhe;
    @Column(name = "Stt_XC")
    private Integer Stt_XC;
    @ManyToOne
    @JoinColumn(name = "maKH")
    private KhachHang khachHang;
    @ManyToOne
    @JoinColumn(name = "maCTGhe")
    private ChiTietGhe chiTietGhe;
    @JsonIgnore
    @OneToMany(mappedBy = "ve")
    private List<ChiTietTopping> chiTietTopping;
}
