package com.cinema.Reponsitory;

import com.cinema.Entity.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TaiKhoanRepository extends JpaRepository<TaiKhoan,Integer> {
    @Query("SELECT tk FROM TaiKhoan tk WHERE tk.username = :username")
    Optional<TaiKhoan> findTaiKhoanByUsername(String username);
}
