package com.cinema.Services.implServices;

import com.cinema.Entity.NhanVien;
import com.cinema.Reponsitory.NhanVienReponsitory;
import com.cinema.Services.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NhanVienServiceImpl implements NhanVienService {
    @Autowired
    NhanVienReponsitory nhanVienReponsitory;

    @Override
    public List<NhanVien> findAll() {
        return nhanVienReponsitory.findAll();
    }

    @Override
    public NhanVien findByEmailAndMatKhau(String email, String matKhau) {
        return nhanVienReponsitory.findByEmailAndMatKhau(email,matKhau);
    }

    @Override
    public NhanVien findByEmail(String email) {
        return nhanVienReponsitory.findByEmail(email);
    }

    @Override
    public NhanVien save(NhanVien nhanVien) {
        return nhanVienReponsitory.save(nhanVien);
    }


}
