package com.cinema.Services.implServices;

import com.cinema.Entity.Phim;
import com.cinema.Reponsitory.PhimReponsitory;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhimServiceImpl implements PhimService {
    @Autowired
    PhimReponsitory phimReponsitory;

    @Override
    public List<Phim> findAll() {
        return phimReponsitory.findAll();
    }

    @Override
    public Phim findById(String maPhim) {
        return phimReponsitory.findById(maPhim).get();
    }

}
