package com.cinema.RestController;

import com.cinema.Services.ChiTietToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/chitiettoppings")
public class ChiTietToppingRestController {
    @Autowired
    ChiTietToppingService chiTietToppingService;


}
