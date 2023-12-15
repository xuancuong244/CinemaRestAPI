package com.cinema.Reponsitory;

import com.cinema.Entity.ChiTietHoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChiTietHoaDonReponsitory extends JpaRepository<ChiTietHoaDon,Long> {
}
