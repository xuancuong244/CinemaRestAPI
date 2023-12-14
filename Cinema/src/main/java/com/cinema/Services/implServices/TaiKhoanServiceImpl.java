package com.cinema.Services.implServices;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TaiKhoanServiceImpl implements TaiKhoanService {

    @Autowired
    TaiKhoanReponsitory taiKhoanReponsitory;

    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanReponsitory.findAll();
    }

    @Override
    public TaiKhoan findById(String username) {
        return taiKhoanReponsitory.findById(username).get();
    }

    @Override
    public List<TaiKhoan> getAdmin() {
        return taiKhoanReponsitory.getAdmin();
    }

    @Override
    public void save(TaiKhoan taiKhoan) {
        taiKhoanReponsitory.save(taiKhoan);
    }

    @Override
    public Optional<TaiKhoan> findTaiKhoanByHoTen(String name) {
        return taiKhoanReponsitory.findTaiKhoanByHoTen(name);
    }
}
