package com.cinema.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "CT_CSVC")
public class ChiTietCSVC{
    @Id
    @ManyToOne
    @JoinColumn(name = "Ma_CSVC")
    private CSVC csvc;

    @Id
    @ManyToOne
    @JoinColumn(name = "Ma_Phong")
    private PhongChieu phongChieu;

    @Column(name = "So_Luong")
    private int soLuong;
}
