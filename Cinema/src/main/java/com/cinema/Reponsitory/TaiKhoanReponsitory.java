package com.cinema.Reponsitory;

import com.cinema.Entity.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TaiKhoanReponsitory extends JpaRepository<TaiKhoan, String> {
    @Query("SELECT DISTINCT ar.taiKhoan FROM Quyen ar WHERE ar.chucVu.maCV IN('DIRE')")
    List<TaiKhoan> getAdmin();

    Optional<TaiKhoan> findTaiKhoanByHoTen(String name);
}
