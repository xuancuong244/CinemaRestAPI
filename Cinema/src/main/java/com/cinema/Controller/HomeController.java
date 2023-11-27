package com.cinema.Controller;

import com.cinema.Entity.Phim;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    PhimService phimService;

    @RequestMapping("/DynamicCinema/index")
    public String home() {
        return "customer/index";
    }

    @RequestMapping("/DynamicCinema/movieDetails")
    public String chiTiet(@RequestParam("maPhim") String maPhim, Model model) {
        Optional<Phim> phim = phimService.findById(maPhim);
        if (phim.isPresent()) {
            model.addAttribute("phim", phim.get());
        }
        return "customer/chitiet_index";
    }

    @RequestMapping("/DynamicCinema/select")
    public String chonGhe() {
        return "customer/index_chonGhe";
    }

    @RequestMapping("/DynamicCinema/movies")
    public String movie() {
        return "customer/movie";
    }

    @RequestMapping("/DynamicCinema/priceTicket")
    public String priceTicket() {
        return "customer/price_Ticket";
    }

    @RequestMapping("/DynamicCinema/payment")
    public String payment() {
        return "customer/topping";
    }

    @RequestMapping("/DynamicCinema/thanhtoan")
    public String thanhtoan() {
        return "customer/thanhtoan";
    }

    @RequestMapping("/DynamicCinema/member")
    public String member() {
        return "customer/account_information_index";
    }

    @RequestMapping("/DynamicCinema/support")
    public String support() {
        return "customer/support_index";
    }

}
