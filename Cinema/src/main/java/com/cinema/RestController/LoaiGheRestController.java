package com.cinema.RestController;

import com.cinema.Entity.LoaiGhe;
import com.cinema.Services.LoaiGheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/LoaiGhe")
public class LoaiGheRestController {
    @Autowired
    LoaiGheService loaiGheService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<LoaiGhe> loaiGhes = loaiGheService.findAll();
        return ResponseEntity.ok(loaiGhes);
    }
}
