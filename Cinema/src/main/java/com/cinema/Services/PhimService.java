package com.cinema.Services;

import com.cinema.Entity.Phim;

import java.util.List;
import java.util.Optional;

public interface PhimService {
    List<Phim> findAll();
    List<Phim> findPhimByTrangThai(String trangThai);
    Optional<Phim> findById(String maPhim);
}
