package com.cinema.Services.implServices;

import com.cinema.Entity.KhachHang;
import com.cinema.Reponsitory.KhachHangReponsitory;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    KhachHangReponsitory khachHangReponsitory;

    @Override
    public List<KhachHang> findAll() {
        return khachHangReponsitory.findAll();
    }
}
