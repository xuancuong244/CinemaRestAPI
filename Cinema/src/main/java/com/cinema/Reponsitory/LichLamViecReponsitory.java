package com.cinema.Reponsitory;

import com.cinema.Entity.LichLamViec;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LichLamViecReponsitory extends JpaRepository<LichLamViec, Integer> {
}
