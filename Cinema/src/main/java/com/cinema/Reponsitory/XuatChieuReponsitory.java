package com.cinema.Reponsitory;

import com.cinema.Entity.XuatChieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface XuatChieuReponsitory extends JpaRepository<XuatChieu, Integer> {
}
