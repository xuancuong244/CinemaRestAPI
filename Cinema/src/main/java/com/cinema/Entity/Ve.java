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
    private Integer idVe;
    private Float tongGiaVe;
    private Float thueVAT;
    private Integer maKH;
    private Integer maCTGhe;
    private Integer sttXuatChieu;
    @ManyToOne
    @JoinColumn(name = "khachHangId")
    private KhachHang khachHang;
    @ManyToOne
    @JoinColumn(name = "chiTietGheId")
    private ChiTietGhe chiTietGhe;
    @JsonIgnore
    @OneToMany(mappedBy = "vee")
    private List<ChiTietTopping> chiTietToppings;
}
