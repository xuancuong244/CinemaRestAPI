package com.cinema.Services;

import com.cinema.Entity.KhachHang;

import java.util.List;

public interface KhachHangService {
    List<KhachHang> findAll();
    KhachHang findByEmailAndMatKhau(String email, String matKhau);
    KhachHang findByEmail(String email);

    KhachHang save(KhachHang khachHang);
}
