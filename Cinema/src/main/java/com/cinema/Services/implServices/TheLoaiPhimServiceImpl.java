package com.cinema.Services.implServices;

import com.cinema.Entity.TheLoaiPhim;
import com.cinema.Reponsitory.TheLoaiPhimReponsitory;
import com.cinema.Services.TheLoaiPhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TheLoaiPhimServiceImpl implements TheLoaiPhimService {
    @Autowired
    TheLoaiPhimReponsitory theLoaiPhimReponsitory;

    @Override
    public List<TheLoaiPhim> findAll() {
        return theLoaiPhimReponsitory.findAll();
    }
}
