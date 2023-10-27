package com.cinema.Services;

import com.cinema.Entity.Phim;

import java.util.List;

public interface PhimService {
    List<Phim> findAll();

    Phim findById(String maPhim);
}
