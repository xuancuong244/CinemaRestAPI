package com.cinema.RestController;

import com.cinema.Entity.PhongChieu;
import com.cinema.Services.PhongChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/PhongChieu")
public class PhongChieuRestController {
    @Autowired
    PhongChieuService phongChieuService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<PhongChieu> phongChieus = phongChieuService.findAll();
        return ResponseEntity.ok(phongChieus);
    }
}
