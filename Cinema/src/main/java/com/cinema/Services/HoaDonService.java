package com.cinema.Services;

import com.cinema.Entity.HoaDon;
import com.fasterxml.jackson.databind.JsonNode;

import java.util.List;

public interface HoaDonService {
    List<HoaDon> findAll();
    HoaDon create(HoaDon hoaDon);
    HoaDon findById(Long id);
    List<HoaDon> findByUsername(String username);
}
