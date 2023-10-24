package com.cinema.Reponsitory;

import com.cinema.Entity.ChucVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChucVuReponsitory extends JpaRepository<ChucVu, String> {
}
