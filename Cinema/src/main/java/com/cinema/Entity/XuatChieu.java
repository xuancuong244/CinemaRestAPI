package com.cinema.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "XuatChieu")
public class XuatChieu {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Stt")
    private Integer stt;
    @Column(name = "GiaXuatChieu")
    private Float giaXuatChieu;
    @Column(name = "Ngay")
    private int ngay;
    @ManyToOne
    @JoinColumn(name = "MaPhong")
    private PhongChieu phongChieu;
    @ManyToOne
    @JoinColumn(name = "MaPhim")
    private Phim phim;
}
