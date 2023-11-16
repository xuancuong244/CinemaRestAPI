package com.cinema.Reponsitory;

import com.cinema.Entity.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KhachHangReponsitory extends JpaRepository<KhachHang, Integer> {
    KhachHang findByEmailAndMatKhau(String email, String matKhau);
    boolean existsByEmail(String email);

    KhachHang findByEmail(String email);
}
