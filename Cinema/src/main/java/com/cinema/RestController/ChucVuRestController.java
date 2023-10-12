package com.cinema.RestController;

import com.cinema.Entity.ChucVu;
import com.cinema.Services.ChucVuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/chucVu")
public class ChucVuRestController {
    @Autowired
    ChucVuService chucVuService;
    @GetMapping()
    public ResponseEntity<?> doGetAll(){
        List<ChucVu> chucVu = chucVuService.findAll();

        return  ResponseEntity.ok(chucVu);
    }
}
