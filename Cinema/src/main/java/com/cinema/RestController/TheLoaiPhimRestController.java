package com.cinema.RestController;

import com.cinema.Entity.TheLoaiPhim;
import com.cinema.Services.TheLoaiPhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/TheLoai")
public class TheLoaiPhimRestController {
    @Autowired
    TheLoaiPhimService theLoaiPhimService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<TheLoaiPhim> theLoaiPhims = theLoaiPhimService.findAll();
        return ResponseEntity.ok(theLoaiPhims);
    }
}
