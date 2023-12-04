package com.cinema.RestController;

import com.cinema.Entity.KhachHang;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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

    @GetMapping("/{maKH}")
    public ResponseEntity<?> doGetOne(@PathVariable Integer maKH){
        Optional<KhachHang> khachHangs = khachHangService.findById(maKH);
        return ResponseEntity.ok(khachHangs);
    }
}
