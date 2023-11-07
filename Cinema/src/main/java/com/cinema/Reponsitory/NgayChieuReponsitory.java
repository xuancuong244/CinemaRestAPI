package com.cinema.Reponsitory;

import com.cinema.Entity.NgayChieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NgayChieuReponsitory extends JpaRepository<NgayChieu, Integer> {
    List<NgayChieu> findByPhim_MaPhim(String maPhim);
}
