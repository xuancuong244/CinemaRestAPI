package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Generated;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "NgayChieu")
public class NgayChieu implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stt")
    private Integer stt;
    @Temporal(TemporalType.DATE)
    @Column(name = "ngay")
    private Date ngay = new Date();
    @Column(name = "gioBatDau")
    private Time gioBatDau;
    @JsonIgnore
    @OneToMany(mappedBy = "Ngay")
    private List<XuatChieu> xuatChieu;
}
