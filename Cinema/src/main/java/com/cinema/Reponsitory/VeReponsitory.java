package com.cinema.Reponsitory;

import com.cinema.Entity.Ve;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VeReponsitory extends JpaRepository<Ve, Integer> {
}
