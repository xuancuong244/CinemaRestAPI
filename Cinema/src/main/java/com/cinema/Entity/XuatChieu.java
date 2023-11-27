package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "xuat_chieu")
public class XuatChieu {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "stt")
    private Integer stt;
    @Column(name = "gia_xuat_chieu")
    private Float giaXuatChieu;
    @ManyToOne
    @JoinColumn(name = "ma_phong")
    private PhongChieu phongChieu;
    @ManyToOne
    @JoinColumn(name = "ma_phim")
    private Phim phim;
    @ManyToOne
    @JoinColumn(name = "ma_ngay_chieu")
    private NgayChieu ngayChieu;
}
