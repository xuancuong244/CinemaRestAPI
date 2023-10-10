package com.cinema.Reponsitory;

import com.cinema.Entity.Phim;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PhimReponsitory extends JpaRepository<Phim, String> {
}
