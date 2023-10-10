package com.cinema.Services.implServices;

import com.cinema.Entity.ChiTietPhim;
import com.cinema.Reponsitory.ChiTietPhimReponsitory;
import com.cinema.Services.ChiTietPhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietPhimServiceImpl implements ChiTietPhimService {
    @Autowired
    ChiTietPhimReponsitory chiTietPhimReponsitory;
    @Override
    public List<ChiTietPhim> findAll() {
        return chiTietPhimReponsitory.findAll();
    }
}
