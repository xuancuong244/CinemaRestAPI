package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChiTietPhim")
public class ChiTietPhim implements Serializable {
    @Id
    @Column(name = "maPhim")
    private String maPhim;

    @Id
    @Column(name = "maTheLoai")
    private String maTheLoai;

    @ManyToOne
    @JoinColumn(name = "theLoaiId")
    private TheLoaiPhim theLoai;
    @ManyToOne
    @JoinColumn(name = "phimId")
    private Phim phim;
}
