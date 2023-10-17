package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Ve")
public class Ve implements Serializable {
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
