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
        chiNhanhReponsitory.findAll();
        return chiNhanhReponsitory.findAll();
    }
    @Override
    public ChiNhanh getChiNhanhMaCN(String maCN) {
        return chiNhanhReponsitory.getById(maCN);
    }

    @Override
    public ChiNhanh create(ChiNhanh chiNhanh) {
        return chiNhanhReponsitory.save(chiNhanh);
    }

    @Override
    public ChiNhanh update(ChiNhanh chiNhanh) {
        return chiNhanhReponsitory.save(chiNhanh);
    }

    @Override
    public void delete(String maCN) {
        chiNhanhReponsitory.deleteById(maCN);
    }
}
