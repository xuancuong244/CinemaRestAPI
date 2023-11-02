package com.cinema.Reponsitory;

import com.cinema.Entity.Phim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PhimReponsitory extends JpaRepository<Phim, String> {
    @Query("SELECT p FROM Phim p WHERE p.trangThai = :trangThai")
    List<Phim> findPhimByTrangThai(String trangThai);
}
