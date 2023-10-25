package com.cinema.RestController;

import com.cinema.Entity.OrderTopping;
import com.cinema.Services.OrderToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/OrderTopping")
public class OrderToppingRestController {
    @Autowired
    OrderToppingService orderToppingService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<OrderTopping> orderToppings = orderToppingService.findAll();
        return ResponseEntity.ok(orderToppings);
    }
}
