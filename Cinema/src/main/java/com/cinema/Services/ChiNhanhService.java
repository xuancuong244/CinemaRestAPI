package com.cinema.Services;

import com.cinema.Entity.ChiNhanh;

import java.util.List;

public interface ChiNhanhService {
    List<ChiNhanh> findAll();
    ChiNhanh getChiNhanhMaCN(String maCN);
}
