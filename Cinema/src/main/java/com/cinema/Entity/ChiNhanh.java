package com.cinema.Entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;


@SuppressWarnings("serial")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CHINHANH")
public class ChiNhanh{
    @Id
    @Column(name = "MACN")
    private String maCN;

    @Column(name = "TENCN")
    private String tenCN;

    @Column(name = "DIACHI")
    private String diaChi;

    @Column(name = "SODT")
    private String soDT;

    @JsonIgnore
    @OneToMany(mappedBy = "chiNhanh")
    List<LichLamViec> lichLamViecList;

    @JsonIgnore
    @OneToMany(mappedBy = "nhanh")
    List<PhongChieu> phongChieuList;
}
