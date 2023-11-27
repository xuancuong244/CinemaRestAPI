package com.cinema.Reponsitory;

import com.cinema.Entity.TheLoaiPhim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TheLoaiPhimReponsitory extends JpaRepository<TheLoaiPhim, String> {
}
