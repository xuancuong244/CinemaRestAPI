package com.cinema.Services.implServices;

import com.cinema.Entity.PhongChieu;
import com.cinema.Reponsitory.PhongChieuReponsitory;
import com.cinema.Services.PhongChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhongChieuServiceImpl implements PhongChieuService {
    @Autowired
    PhongChieuReponsitory phongChieuReponsitory;

    @Override
    public List<PhongChieu> findAll() {
        return phongChieuReponsitory.findAll();
    }
}
