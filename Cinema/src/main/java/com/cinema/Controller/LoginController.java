package com.cinema.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
public class LoginController {
<<<<<<< Updated upstream
    @Autowired
    TaiKhoanService taiKhoanService;

    @RequestMapping("/index/login/form")
    public String loginForm(){
        return "customer/login";
    }

    @RequestMapping("/index/register/form")
    public String registerForm(){
        return "customer/signup";
    }

    @RequestMapping("/index/logout")
    public String logout() {
        // Thực hiện xử lý đăng xuất nếu cần
        return "redirect:/index/login/form"; // Chuyển hướng về trang đăng nhập sau khi đăng xuất
    }
=======
//    @Autowired
//    TaiKhoanService taiKhoanService;
//
//    @RequestMapping("/index/login/form")
//    public String loginForm(){
//        return "customer/loginForm";
//    }
//
//    @RequestMapping("/index/register/form")
//    public String registerForm(){
//        return "customer/registerForm";
//    }
//
//    @RequestMapping("/index/logout")
//    public String logout() {
//        // Thực hiện xử lý đăng xuất nếu cần
//        return "redirect:/index/login/form"; // Chuyển hướng về trang đăng nhập sau khi đăng xuất
//    }
>>>>>>> Stashed changes
}
