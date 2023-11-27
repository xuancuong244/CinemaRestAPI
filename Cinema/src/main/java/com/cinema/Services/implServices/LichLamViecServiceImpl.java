package com.cinema.Services.implServices;

import com.cinema.Entity.LichLamViec;
import com.cinema.Reponsitory.LichLamViecReponsitory;
import com.cinema.Services.LichLamViecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LichLamViecServiceImpl implements LichLamViecService {
    @Autowired
    LichLamViecReponsitory lichLamViecReponsitory;

    @Override
    public List<LichLamViec> findAll() {
        return lichLamViecReponsitory.findAll();
    }
}
