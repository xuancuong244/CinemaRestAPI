package com.cinema.RestController;

import com.cinema.Entity.Phim;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Phim")
public class PhimRestController {
    @Autowired
    PhimService phimService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<Phim> phims = phimService.findAll();
        return ResponseEntity.ok(phims);
    }
}
