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
    public Optional<Phim> findById(String maPhim) {
        return phimReponsitory.findById(maPhim);
    }

    @Override
    public Phim create(Phim phim) {
        return phimReponsitory.save(phim);
    }

    @Override
    public Phim update(Phim phim) {
        return phimReponsitory.save(phim);
    }

    @Override
    public void delete(String phim) {
        phimReponsitory.deleteById(phim);
    }

    @Override
    public List<Phim> findByKeywords(String keyword) {
        return phimReponsitory.findByKeywords(keyword);
    }
}
