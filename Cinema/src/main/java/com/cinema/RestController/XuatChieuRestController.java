package com.cinema.RestController;

import com.cinema.Entity.XuatChieu;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
