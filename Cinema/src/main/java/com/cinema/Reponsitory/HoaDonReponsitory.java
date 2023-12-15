package com.cinema.Reponsitory;

import com.cinema.Entity.HoaDon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HoaDonReponsitory extends JpaRepository<HoaDon,Long> {
    @Query("SELECT o FROM HoaDon o WHERE o.tenNguoiDung=?1")
    List<HoaDon> findByUsername(String username);
}
