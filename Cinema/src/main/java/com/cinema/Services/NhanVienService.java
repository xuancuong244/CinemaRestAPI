package com.cinema.Services;

import com.cinema.Entity.NhanVien;

import java.util.List;

public interface NhanVienService {
    List<NhanVien> findAll();
    NhanVien findByEmailAndMatKhau(String email, String matKhau);
    NhanVien findByEmail(String email);
    NhanVien save(NhanVien nhanVien);
    boolean existsById(String emplId);

    void deleteEmployee(String emplId);

    NhanVien updateEmployee(String emplId, NhanVien updatedEmployee);

    NhanVien addEmployee(NhanVien employee);
}
