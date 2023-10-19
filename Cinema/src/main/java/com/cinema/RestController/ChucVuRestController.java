package com.cinema.RestController;

import com.cinema.Entity.ChucVu;
import com.cinema.Services.ChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/chucVu")
public class ChucVuRestController {
    @Autowired
    ChucVuService chucVuService;

    // localhost:8085/api/chucVu/all
    @GetMapping()
    public ResponseEntity<?> doGetAll(){
        List<ChucVu> chucVus = chucVuService.findAll();
        return ResponseEntity.ok(chucVus);
    }

    @GetMapping("/maCV={maCV}")
    public ResponseEntity<?> getById(@RequestParam("maCV") String maCV){
        ChucVu chucVu = chucVuService.findById(maCV);
        return ResponseEntity.ok(chucVu);
    }
}
