package com.cinema.Reponsitory;

import com.cinema.Entity.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TaiKhoanRepository  extends JpaRepository<TaiKhoan,Integer>{
    Optional<TaiKhoan> findTaiKhoanByUsername(String username);

//    @Query("SELECT DISTINCT ar.TaiKhoan FROM ChucVu ar WHERE ar.role.id IN('DIRE','STAF')")
//    List<TaiKhoan> getAdministrators();
}
