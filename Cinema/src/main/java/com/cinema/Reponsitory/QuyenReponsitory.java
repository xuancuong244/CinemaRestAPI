package com.cinema.Reponsitory;

import com.cinema.Entity.Quyen;
import com.cinema.Entity.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface QuyenReponsitory extends JpaRepository<Quyen, Integer> {
    @Query("SELECT DISTINCT a FROM Quyen a WHERE a.taiKhoan IN ?1")
    List<Quyen> authoritiesOf(List<TaiKhoan> list);
}
