package com.cinema.Reponsitory;

import com.cinema.Entity.CSVC;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CSVCReponsitory extends JpaRepository<CSVC, String> {
}
