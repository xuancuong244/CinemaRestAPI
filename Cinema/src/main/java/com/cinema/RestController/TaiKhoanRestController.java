package com.cinema.RestController;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/TaiKhoan")
public class TaiKhoanRestController {
//    @Autowired
//    TaiKhoanService taiKhoanService;
//
//    @PostMapping("/register")
//    public ResponseEntity<String> registerUser(@RequestBody TaiKhoan taiKhoan) {
//        // Thực hiện lưu tài khoản vào cơ sở dữ liệu
//        taiKhoanService.saveTaiKhoan(taiKhoan);
//        return ResponseEntity.ok("Đăng ký thành công!");
//    }
}
