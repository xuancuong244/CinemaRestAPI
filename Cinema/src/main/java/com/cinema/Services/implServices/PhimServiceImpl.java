package com.cinema.Services.implServices;

import com.cinema.Entity.Phim;
import com.cinema.Reponsitory.PhimReponsitory;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PhimServiceImpl implements PhimService {
    @Autowired
    PhimReponsitory phimReponsitory;

    @Override
    public List<Phim> findAll() {
        return phimReponsitory.findAll();
    }

    @Override
    public List<Phim> findPhimByTrangThai(String trangThai) {
        return phimReponsitory.findPhimByTrangThai(trangThai);
    }
    @Override
    public Phim findById(String maPhim) {
        Optional<Phim> phim = phimReponsitory.findById(maPhim);
        return phim.orElse(null);
    }

}
