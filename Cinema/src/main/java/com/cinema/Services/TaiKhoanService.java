package com.cinema.Services;

import com.cinema.Entity.TaiKhoan;

import java.util.List;

public interface TaiKhoanService {
    List<TaiKhoan> findAll();
    TaiKhoan findById(String email);
    List<TaiKhoan> getAdmin();

    void save(TaiKhoan taiKhoan);
}
