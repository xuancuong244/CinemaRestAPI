package com.cinema.Services.implServices;

import com.cinema.Entity.ChiTietHoaDon;
import com.cinema.Reponsitory.ChiTietHoaDonReponsitory;
import com.cinema.Services.ChiTietHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;

public class ChiTietHoaDonServiceImpl implements ChiTietHoaDonService {
    @Autowired
    ChiTietHoaDonReponsitory chiTietHoaDonReponsitory;

    @Override
    public ChiTietHoaDon createChiTietHoaDon(ChiTietHoaDon chiTietHoaDon) {
        return chiTietHoaDonReponsitory.save(chiTietHoaDon);
    }
}
