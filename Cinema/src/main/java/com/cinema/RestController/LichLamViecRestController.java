package com.cinema.RestController;

import com.cinema.Entity.LichLamViec;
import com.cinema.Services.LichLamViecService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/LichLamViec")
public class LichLamViecRestController {
    @Autowired
    LichLamViecService lichLamViecService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<LichLamViec> lichLamViecs = lichLamViecService.findAll();
        return ResponseEntity.ok(lichLamViecs);
    }
}
