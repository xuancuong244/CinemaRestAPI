package com.cinema.Services.implServices;

import com.cinema.Entity.CSVC;
import com.cinema.Reponsitory.CSVCReponsitory;
import com.cinema.Services.CoSoVatChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoSoVatChatServiceImpl implements CoSoVatChatService {
    @Autowired
    CSVCReponsitory csvcReponsitory;

    @Override
    public List<CSVC> findAll() {
        return csvcReponsitory.findAll();
    }
}
