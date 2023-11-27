package com.cinema.RestController;

import com.cinema.Entity.KhachHang;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/KhachHang")
public class KhachHangRestController {
    @Autowired
    KhachHangService khachHangService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<KhachHang> khachHangs = khachHangService.findAll();
        return ResponseEntity.ok(khachHangs);
    }
}
