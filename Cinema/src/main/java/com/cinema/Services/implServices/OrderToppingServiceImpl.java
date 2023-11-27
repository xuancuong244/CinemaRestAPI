package com.cinema.Services.implServices;

import com.cinema.Entity.OrderTopping;
import com.cinema.Reponsitory.OrderToppingReponsitory;
import com.cinema.Services.OrderToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderToppingServiceImpl implements OrderToppingService {
    @Autowired
    OrderToppingReponsitory orderToppingReponsitory;

    @Override
    public List<OrderTopping> findAll() {
        return orderToppingReponsitory.findAll();
    }
}
