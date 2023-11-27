package com.cinema.Services;

import com.cinema.Entity.NgayChieu;

import java.util.List;

public interface NgayChieuService {
    List<NgayChieu> findAll();
    List<NgayChieu> findByPhim_MaPhim(String maPhim);
}
