package com.cinema.RestController;

import com.cinema.Entity.NhanVien;
import com.cinema.Services.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/NhanVien")
public class NhanVienRestController {
    @Autowired
    NhanVienService nhanVienService;

    @GetMapping()
    public ResponseEntity<?> doGetAll(){
        List<NhanVien> nhanVien = nhanVienService.findAll();

        return ResponseEntity.ok(nhanVien);
    }
}
