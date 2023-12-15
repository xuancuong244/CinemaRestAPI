package com.cinema.Entity;

import lombok.*;

import javax.persistence.*;
import java.sql.Time;
import java.util.Date;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Data
@Table(name = "chi_tiet_hoa_don")
public class ChiTietHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "hoa_don_id")
    private HoaDon hoaDon;

    @Column(name = "ten_phim")
    private String tenPhim;

    @Column(name = "ngay_chieu")
    private Date ngayChieu;

    @Column(name = "gio_chieu")
    private Time gioChieu;

    @Column(name = "loai_ghes")
    private String loaiGhe;

    @Column(name = "gia_ghes")
    private double giaGhe;

    @Column(name = "gia_topping")
    private double giaTopping;

}
