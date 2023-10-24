package com.cinema.Reponsitory;

import com.cinema.Entity.ChiNhanh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChiNhanhReponsitory extends JpaRepository<ChiNhanh, String> {

}
