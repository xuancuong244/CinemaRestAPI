package com.cinema.Services.implServices;

import com.cinema.Entity.NgayChieu;
import com.cinema.Reponsitory.NgayChieuReponsitory;
import com.cinema.Services.NgayChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NgayChieuServiceImpl implements NgayChieuService {
    @Autowired
    NgayChieuReponsitory ngayChieuReponsitory;

    @Override
    public List<NgayChieu> findAll() {
        return ngayChieuReponsitory.findAll();
    }
    @Override
    public List<NgayChieu> findByPhim_MaPhim(String maPhim) {
        return ngayChieuReponsitory.findByPhim_MaPhim(maPhim);
    }
}
