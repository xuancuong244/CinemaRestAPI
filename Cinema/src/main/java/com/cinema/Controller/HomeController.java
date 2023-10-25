package com.cinema.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/DynamicCinema/index")
    public String home(){
        return "customer/index";
    }
    
    @RequestMapping("/DynamicCinema/indexx")
    public String chiTiet(){
        return "customer/chitiet_index";
    }
}
