package com.cinema.RestController;

import com.cinema.Entity.NgayChieu;
import com.cinema.Services.NgayChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.sql.Time;
import java.util.Date;
import java.util.List;


@CrossOrigin("*")
@RestController
@RequestMapping("/api/NgayChieu")
public class NgayChieuRestController {
    @Autowired
    NgayChieuService ngayChieuService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<NgayChieu> ngayChieus = ngayChieuService.findAll();
        return ResponseEntity.ok(ngayChieus);
    }

    @GetMapping("/maPhim")
    public ResponseEntity<?> getNgayChieuByMaPhim(@RequestParam("maPhim") String maPhim){
        List<NgayChieu> ngayChieus = ngayChieuService.findByPhim_MaPhim(maPhim);
        return ResponseEntity.ok(ngayChieus);
    }
}
