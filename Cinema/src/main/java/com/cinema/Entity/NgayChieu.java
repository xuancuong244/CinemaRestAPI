package com.cinema.Entity;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "ngay_chieu")
public class NgayChieu {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Stt")
    private Integer stt;
    @Temporal(TemporalType.DATE)
    @Column(name = "Ngay")
    private Date ngay = new Date();
    @Column(name = "Gio_Bat_Dau")
    private Time gioBatDau;
    @ManyToOne
    @JoinColumn(name = "Ma_Phim")
    private Phim phim;
}
