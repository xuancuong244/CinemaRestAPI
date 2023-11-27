package com.cinema.Services.implServices;

import com.cinema.Entity.ChiNhanh;
import com.cinema.Reponsitory.ChiNhanhReponsitory;
import com.cinema.Services.ChiNhanhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

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

    @Override
    public Optional<ChiNhanh> findById(String maCN) {
        return chiNhanhReponsitory.findById(maCN);
    }


}
