package com.cinema.RestController;

import com.cinema.Entity.Phim;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("/{maPhim}")
    public ResponseEntity<?> getByMaPhim(@PathVariable("maPhim") String maPhim){
        Phim phim = phimService.findById(maPhim);
        return ResponseEntity.ok(phim);
    }

    @GetMapping("/trangThai/{trangThai}")
    public ResponseEntity<?> getByTrangThaiPhim(@PathVariable("trangThai") String trangThai){
        List<Phim> phims = phimService.findPhimByTrangThai(trangThai);
        return ResponseEntity.ok(phims);
    }
}
