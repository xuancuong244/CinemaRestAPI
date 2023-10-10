package com.cinema.Services.implServices;

import com.cinema.Entity.Ve;
import com.cinema.Reponsitory.VeReponsitory;
import com.cinema.Services.VeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VeServiceImpl implements VeService {
    @Autowired
    VeReponsitory veReponsitory;
    @Override
    public List<Ve> findAll() {
        return veReponsitory.findAll();
    }
}
