package com.cinema.Reponsitory;

import com.cinema.Entity.Ghe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GheReponsitory extends JpaRepository<Ghe, String> {
}
