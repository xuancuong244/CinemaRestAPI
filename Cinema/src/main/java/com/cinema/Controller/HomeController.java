package com.cinema.Controller;

import com.cinema.Entity.Phim;
import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
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

import java.util.Optional;

@Controller
public class HomeController {
    @Autowired
    PhimService phimService;

    @Autowired
    TaiKhoanService taiKhoanService;

    @RequestMapping({"/","/DynamicCinema/index"})
    public String home(Model model) {

        // Lấy thông tin Authentication từ context
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        // Lấy tên đăng nhập từ Authentication
        String name = authentication.getName();

        // Sử dụng TaiKhoanRepository để lấy thông tin TaiKhoan
        Optional<TaiKhoan> taiKhoan = taiKhoanService.findTaiKhoanByHoTen(name);

        if (taiKhoan.isPresent()) {
            // Tài khoản tồn tại, lấy thông tin hoTen
            String hoTen = taiKhoan.get().getHoTen();
            model.addAttribute("hoTen", hoTen);
        } else {
            // Xử lý khi tài khoản không tồn tại
            // ...
        }

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

    @RequestMapping("/DynamicCinema/cinemaCorner")
    public String cinemaCorner() {
        return "customer/cinemaCorner";
    }

    @RequestMapping("/DynamicCinema/event")
    public String event() {
        return "customer/event_index";
    }
}
