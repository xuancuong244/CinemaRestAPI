package com.cinema.Services.implServices;

import com.cinema.Entity.KhachHang;
import com.cinema.Reponsitory.KhachHangReponsitory;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    KhachHangReponsitory khachHangReponsitory;

    @Override
    public List<KhachHang> findAll() {
        return khachHangReponsitory.findAll();
    }

    @Override
    public KhachHang findByEmailAndMatKhau(String email, String matKhau) {
        return khachHangReponsitory.findByEmailAndMatKhau(email,matKhau);
    }

    @Override
    public KhachHang findByEmail(String email) {
        return khachHangReponsitory.findByEmail(email);
    }

    @Override
    public KhachHang save(KhachHang khachHang) {
        return khachHangReponsitory.save(khachHang);
    }

    @Override
    public Optional<KhachHang> findById(Integer userId) {
        return khachHangReponsitory.findById(userId);
    }
}
