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
@Table(name = "ChiTietGhe")
public class ChiTietGhe implements Serializable {
    @Id
    private Integer maCTGhe;
    private String maPhong;
    private String maGhe;
    @ManyToOne
    @JoinColumn(name = "gheId")
    private Ghe ghe;
    @ManyToOne
    @JoinColumn(name = "phongChieuId")
    private PhongChieu phongChieu;
    @JsonIgnore
    @OneToMany(mappedBy = "chiTietGhe")
    private List<Ve> veList;

}
