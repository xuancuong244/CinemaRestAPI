package com.cinema.Services;

import com.cinema.Entity.ChiNhanh;

import java.util.List;
import java.util.Optional;

public interface ChiNhanhService {
    List<ChiNhanh> findAll();

    ChiNhanh create(ChiNhanh chiNhanh);
    ChiNhanh update(ChiNhanh chiNhanh);
    void delete(String maCN);

    Optional<ChiNhanh> findById(String maCN);
}
