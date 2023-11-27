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
    @Column(name = "Stt")
    private Integer stt;
    @Column(name = "Gia_Xuat_Chieu")
    private Float giaXuatChieu;
    @ManyToOne
    @JoinColumn(name = "Ma_Phong")
    private PhongChieu phongChieu;
    @ManyToOne
    @JoinColumn(name = "Ma_Phim")
    private Phim phim;
    @ManyToOne
    @JoinColumn(name = "Ma_Ngay_Chieu")
    private NgayChieu ngayChieu;
}
