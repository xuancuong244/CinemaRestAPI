package com.cinema.Services.implServices;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.TaiKhoanRepository;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< Updated upstream
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
=======

import java.util.Optional;

>>>>>>> Stashed changes
public class TaiKhoanServiceImpl implements TaiKhoanService {
    @Autowired
    TaiKhoanRepository taiKhoanRepository;

    @Override
    public Optional<TaiKhoan> findTaiKhoanByUsername(String username) {
        return taiKhoanRepository.findTaiKhoanByUsername(username);
    }
}
