package com.cinema.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping({"/admin","/DynamicCinema/admin/index"})
    public String adminIndex() {
        return "admin/thongKe";
    }

    @RequestMapping("/DynamicCinema/admin/khachHang")
    public String khachHang() {
        return "admin/khachHang";
    }

    @RequestMapping("/DynamicCinema/admin/phim")
    public String phim() {
        return "admin/phim";
    }

    @RequestMapping("/DynamicCinema/admin/suatChieu")
    public String suatChieu() {
        return "admin/suatChieu";
    }

    @RequestMapping("/DynamicCinema/admin/topping")
    public String topping() {
        return "admin/topping";
    }

    @RequestMapping("/DynamicCinema/admin/quanLyHoaDon")
    public String quanLyHoaDon() {
        return "admin/quanLyHoaDon";
    }

    @RequestMapping("/DynamicCinema/admin/ngayChieu")
    public String ngayChieu() {
        return "admin/ngayChieu";
    }
    @RequestMapping("/DynamicCinema/admin/ve")
    public String ve() {
        return "admin/ve";
    }
}
