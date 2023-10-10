package com.cinema.Services.implServices;

import com.cinema.Entity.ChiTietGhe;
import com.cinema.Reponsitory.ChiTietGheReponsitory;
import com.cinema.Services.ChiTietGheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietGheServiceImpl implements ChiTietGheService {
    @Autowired
    ChiTietGheReponsitory chiTietGheReponsitory;
    @Override
    public List<ChiTietGhe> findAll() {
        return chiTietGheReponsitory.findAll();
    }
}
