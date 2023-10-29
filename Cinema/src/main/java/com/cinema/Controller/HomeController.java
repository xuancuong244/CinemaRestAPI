package com.cinema.Controller;

import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @Autowired
    PhimService phimService;

    @RequestMapping("/DynamicCinema/index")
    public String home(){
        return "customer/index";
    }

    @RequestMapping("/DynamicCinema/movieDetails")
//    Model model, @PathVariable("maPhim") String maPhim
    public String chiTiet(){
//        Phim phim = phimService.findById(maPhim);
//        model.addAttribute("phim",phim);
        return "customer/chitiet_index";
    }
}
