package com.cinema.RestController;

import com.cinema.Entity.Phim;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

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
    public ResponseEntity<?> getByMaPhim(@PathVariable String maPhim){
        Optional<Phim> phim = phimService.findById(maPhim);
        if (phim.isPresent()){
            return ResponseEntity.ok(phim.get());
        }else{
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/trangThai/{trangThai}")
    public ResponseEntity<?> getByTrangThaiPhim(@PathVariable("trangThai") String trangThai){
        List<Phim> phims = phimService.findPhimByTrangThai(trangThai);
        return ResponseEntity.ok(phims);
    }

}


