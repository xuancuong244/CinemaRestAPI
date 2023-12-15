package com.cinema.Controller;

import com.cinema.Entity.Phim;
import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
//import com.cinema.Services.EmailService;
import com.cinema.Services.PhimService;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    PhimService phimService;

    @Autowired
    TaiKhoanService taiKhoanService;


//    @Autowired
//    EmailService emailService;
    @RequestMapping({"/","/DynamicCinema/index"})
    public String home(Model model, Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/index";
    }

    @RequestMapping("/DynamicCinema/movieDetails")
    public String chiTiet(@RequestParam("maPhim") String maPhim, Model model, Principal principal) {

        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }

        Optional<Phim> phim = phimService.findById(maPhim);
        if (phim.isPresent()) {
            model.addAttribute("phim", phim.get());
        }
        return "customer/chitiet_index";
    }

    @RequestMapping("/DynamicCinema/select")
    public String chonGhe(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }

        return "customer/index_chonGhe";
    }

    @RequestMapping("/DynamicCinema/movies")
    public String movie(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/movie";
    }

    @RequestMapping("/DynamicCinema/priceTicket")
    public String priceTicket(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/price_Ticket";
    }

    @RequestMapping("/DynamicCinema/payment")
    public String payment(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("customerName", user.getHoTen());
            model.addAttribute("customerPhone", user.getSoDT());
            model.addAttribute("customerEmail", user.getUsername());
        }
        return "customer/topping";
    }

    @RequestMapping("/DynamicCinema/thanhtoan")
    public String thanhtoan(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("customerName", user.getHoTen());
            model.addAttribute("customerPhone", user.getSoDT());
            model.addAttribute("customerEmail", user.getUsername());
        }
        return "customer/thanhtoan";
    }

    @RequestMapping("/DynamicCinema/member")
    public String member(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/account_information_index";
    }

    @RequestMapping("/DynamicCinema/support")
    public String support(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/support_index";
    }

    @RequestMapping("/DynamicCinema/cinemaCorner")
    public String cinemaCorner(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/cinemaCorner";
    }

    @RequestMapping("/DynamicCinema/event")
    public String event(Model model,Principal principal) {
        if (principal != null) {
            String username = principal.getName();
            TaiKhoan user = taiKhoanService.findById(username);
            model.addAttribute("hoTen", user.getHoTen());
        }
        return "customer/event_index";
    }
}
