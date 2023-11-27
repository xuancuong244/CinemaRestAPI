package com.cinema.Reponsitory;

import com.cinema.Entity.PhongChieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhongChieuReponsitory extends JpaRepository<PhongChieu, String> {
}
