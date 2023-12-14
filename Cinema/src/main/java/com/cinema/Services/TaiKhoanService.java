package com.cinema.Services;

import com.cinema.Entity.TaiKhoan;

import java.util.List;
import java.util.Optional;

public interface TaiKhoanService {
    List<TaiKhoan> findAll();
    TaiKhoan findById(String username);
    List<TaiKhoan> getAdmin();

    void save(TaiKhoan taiKhoan);

    Optional<TaiKhoan> findTaiKhoanByHoTen(String name);
}
