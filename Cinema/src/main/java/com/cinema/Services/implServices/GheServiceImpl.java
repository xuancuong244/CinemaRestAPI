package com.cinema.Services.implServices;

import com.cinema.Entity.Ghe;
import com.cinema.Reponsitory.GheReponsitory;
import com.cinema.Services.GheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GheServiceImpl implements GheService {
    @Autowired
    GheReponsitory gheReponsitory;

    @Override
    public List<Ghe> findAll() {
        return gheReponsitory.findAll();
    }
}
