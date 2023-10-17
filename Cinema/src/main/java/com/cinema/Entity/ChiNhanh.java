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
@Table(name = "ChiNhanh")
public class ChiNhanh implements Serializable {
    @Id
    @Column(name = "maCN")
    private String maCN;

    @Column(name = "tenCN")
    private String tenCN;

    @Column(name = "diaChi")
    private String diaChi;

    @Column(name = "soDT")
    private String soDT;

    @JsonIgnore
    @OneToMany(mappedBy = "chiNhanh")
    List<LichLamViec> lichLamViecList;

    @JsonIgnore
    @OneToMany(mappedBy = "nhanh")
    List<PhongChieu> phongChieuList;
}
