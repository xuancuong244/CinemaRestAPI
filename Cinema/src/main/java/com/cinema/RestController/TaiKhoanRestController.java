//package com.cinema.RestController;

import com.cinema.Entity.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

//@RestController
//@RequestMapping("/api/TaiKhoan")
//public class TaiKhoanRestController {
//    @Autowired
//    TaiKhoanService taiKhoanService;
//
//    @GetMapping("/username")
//    public ResponseEntity<?> getAll(@RequestParam("username") String username){
//        Optional<TaiKhoan> taiKhoans = taiKhoanService.findTaiKhoanByUsername(username);
//        return ResponseEntity.ok(username);
//    }
//}
