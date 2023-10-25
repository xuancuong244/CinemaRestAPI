package com.cinema.Entity;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "NGAYCHIEU")
public class NgayChieu {
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
