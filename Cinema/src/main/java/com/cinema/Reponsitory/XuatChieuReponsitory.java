package com.cinema.Reponsitory;

import com.cinema.Entity.XuatChieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface XuatChieuReponsitory extends JpaRepository<XuatChieu, Integer> {
    @Query("SELECT xc FROM XuatChieu xc WHERE xc.phim.maPhim = :maPhim")
    List<XuatChieu> findByMaPhim(String maPhim);
}
