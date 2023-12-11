package com.cinema.Services.implServices;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaiKhoanServiceImpl implements TaiKhoanService {

    @Autowired
    TaiKhoanReponsitory taiKhoanReponsitory;

    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanReponsitory.findAll();
    }

    @Override
    public TaiKhoan findById(String email) {
        return taiKhoanReponsitory.findById(email).get();
    }

    @Override
    public List<TaiKhoan> getAdmin() {
        return taiKhoanReponsitory.getAdmin();
    }

    @Override
    public void save(TaiKhoan taiKhoan) {
        taiKhoanReponsitory.save(taiKhoan);
    }
}
