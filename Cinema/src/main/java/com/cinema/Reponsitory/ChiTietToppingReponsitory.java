package com.cinema.Reponsitory;

import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.cinema.Entity.*;

import java.util.List;

@Repository
public interface ChiTietToppingReponsitory extends JpaRepository<ChiTietTopping,ChiTietToppingId>{
    List<ChiTietTopping> findAll();
}
