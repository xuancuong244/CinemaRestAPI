package com.cinema.Reponsitory;

import com.cinema.Entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NhanVienReponsitory extends JpaRepository<NhanVien, String> {
}
