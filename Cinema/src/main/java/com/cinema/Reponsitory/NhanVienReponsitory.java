package com.cinema.Reponsitory;

import com.cinema.Entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NhanVienReponsitory extends JpaRepository<NhanVien, String> {
    NhanVien findByEmailAndMatKhau(String email, String matKhau);

    NhanVien findByEmail(String email);
}
