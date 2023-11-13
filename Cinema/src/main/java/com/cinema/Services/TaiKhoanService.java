package com.cinema.Services;

import com.cinema.Entity.TaiKhoan;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

public interface TaiKhoanService {
    Optional<TaiKhoan> findTaiKhoanByUsername(String username);
//    List<TaiKhoan> getAdministrators();
}
