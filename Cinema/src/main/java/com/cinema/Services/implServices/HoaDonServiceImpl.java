package com.cinema.Services.implServices;

import com.cinema.Entity.HoaDon;
import com.cinema.Reponsitory.HoaDonReponsitory;
import com.cinema.Services.HoaDonService;
import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonServiceImpl implements HoaDonService {

    @Autowired
    HoaDonReponsitory hoaDonReponsitory;

    @Override
    public List<HoaDon> findAll() {
        return hoaDonReponsitory.findAll();
    }

    @Override
    public HoaDon create(HoaDon hoaDon) {
        return hoaDonReponsitory.save(hoaDon);
    }

    @Override
    public HoaDon findById(Long id) {
        return hoaDonReponsitory.findById(id).get();
    }

    @Override
    public List<HoaDon> findByUsername(String username) {
        return hoaDonReponsitory.findByUsername(username);
    }
}
