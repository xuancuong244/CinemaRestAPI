package com.cinema.Services.implServices;

import com.cinema.Entity.LoaiGhe;
import com.cinema.Reponsitory.LoaiGheReponsitory;
import com.cinema.Services.LoaiGheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoaiGheServiceImpl implements LoaiGheService {
    @Autowired
    LoaiGheReponsitory loaiGheReponsitory;

    @Override
    public List<LoaiGhe> findAll() {
        return loaiGheReponsitory.findAll();
    }
}
