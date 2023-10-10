package com.cinema.Services.implServices;

import com.cinema.Entity.ChiNhanh;
import com.cinema.Reponsitory.ChiNhanhReponsitory;
import com.cinema.Services.ChiNhanhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChiNhanhServiceImpl implements ChiNhanhService {
    @Autowired
    ChiNhanhReponsitory chiNhanhReponsitory;

    @Override
    public List<ChiNhanh> findAll(){
        return chiNhanhReponsitory.findAll();
    }

    @Override
    public ChiNhanh getChiNhanhMaCN(String maCN) {
        return chiNhanhReponsitory.getById(maCN);
    }
}
