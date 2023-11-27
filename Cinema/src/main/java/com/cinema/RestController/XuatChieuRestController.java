package com.cinema.RestController;

import com.cinema.Entity.XuatChieu;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/XuatChieu")
public class XuatChieuRestController {
    @Autowired
    XuatChieuService xuatChieuService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<XuatChieu> xuatChieus = xuatChieuService.findAll();
        return  ResponseEntity.ok(xuatChieus);
    }

    @GetMapping("/maPhim")
    public ResponseEntity<?> getXuatChieuByMaPhim(@RequestParam("maPhim") String maPhim){
        List<XuatChieu> xuatChieus = xuatChieuService.findByMaPhim(maPhim);
        return ResponseEntity.ok(xuatChieus);
    }


}
