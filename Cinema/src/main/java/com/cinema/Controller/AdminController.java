package com.cinema.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping({"/admin","/DynamicCinema/admin/index"})
    public String adminIndex() {
        return "admin/thongKe";
    }

    @RequestMapping("/DynamicCinema/admin/TaiKhoan")
    public String khachHang() {
        return "admin/TaiKhoan";
    }

    @RequestMapping("/DynamicCinema/admin/phim")
    public String phim() {
        return "admin/phim";
    }

    @RequestMapping("/DynamicCinema/admin/topping")
    public String topping() {
        return "admin/topping";
    }


    @RequestMapping("/DynamicCinema/admin/ngayChieu")
    public String ngayChieu() {
        return "admin/ngayChieu";
    }
}
