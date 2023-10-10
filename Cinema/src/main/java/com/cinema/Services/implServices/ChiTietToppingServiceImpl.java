package com.cinema.Services.implServices;

import com.cinema.Entity.ChiTietTopping;
import com.cinema.Reponsitory.ChiTietToppingReponsitory;
import com.cinema.Services.ChiTietToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiTietToppingServiceImpl implements ChiTietToppingService {
    @Autowired
    ChiTietToppingReponsitory chiTietToppingReponsitory;

    @Override
    public List<ChiTietTopping> findAll() {
        return chiTietToppingReponsitory.findAll();
    }
}
