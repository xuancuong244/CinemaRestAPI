package com.cinema.Services;

import com.cinema.Entity.TaiKhoan;

import java.util.List;

public interface TaiKhoanService {
    List<TaiKhoan> findAll();
    TaiKhoan findById(String username);
    List<TaiKhoan> getAdmin();

    void save(TaiKhoan taiKhoan);
}
