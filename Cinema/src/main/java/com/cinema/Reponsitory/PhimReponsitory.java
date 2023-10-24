package com.cinema.Reponsitory;

import com.cinema.Entity.Phim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PhimReponsitory extends JpaRepository<Phim, String> {
}
