package com.cinema.Services.implServices;

import com.cinema.Entity.ChucVu;
import com.cinema.Reponsitory.ChucVuReponsitory;
import com.cinema.Services.ChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChucVuServiceImpl implements ChucVuService {
    @Autowired
    ChucVuReponsitory chucVuReponsitory;

    @Override
    public List<ChucVu> findAll() {
        return chucVuReponsitory.findAll();
    }
}
