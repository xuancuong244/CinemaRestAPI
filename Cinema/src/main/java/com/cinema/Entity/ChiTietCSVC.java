package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "CT_CSVC")
public class ChiTietCSVC implements Serializable{
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
