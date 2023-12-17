package com.cinema.Controller;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {
    @Autowired
    TaiKhoanService taiKhoanService;

    @RequestMapping("/security/login/form")
    public String loginForm(Model model) {
        return "security/signInSignUp";
    }

    @RequestMapping("/security/login/success")
    public String loginSuccess(Model model) {
        model.addAttribute("message", "Đăng nhập thành công");
        System.out.println("Login success!");
        return "security/signInSignUp";
    }

    @RequestMapping("/security/login/error")
    public String loginError(Model model) {
        model.addAttribute("message", "Sai thông tin đăng nhập");
        return "security/signInSignUp";
    }

    @RequestMapping("/security/unauthoried")
    public String unauthoried(Model model) {
        model.addAttribute("message", "Không có quyền truy xuất");
        return "security/signInSignUp";
    }

    @RequestMapping("/security/logoff/success")
    public String logoffSuccess(Model model) {
        model.addAttribute("message", "Đăng xuất thành công !");
        return "security/signInSignUp";
    }

//    @PostMapping("/security/register")
//    public String register(@ModelAttribute TaiKhoan taiKhoan) {
//        // Thực hiện bất kỳ kiểm tra hợp lệ cần thiết
//
//        // Lưu người dùng
//        taiKhoanService.save(taiKhoan);
//
//        // Chuyển hướng đến trang đăng nhập hoặc bất kỳ trang khác phù hợp
//        return "security/login";
//    }
}
