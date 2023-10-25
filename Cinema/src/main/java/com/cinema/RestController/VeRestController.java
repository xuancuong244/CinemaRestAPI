package com.cinema.RestController;

import com.cinema.Entity.Ve;
import com.cinema.Services.VeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Ve")
public class VeRestController {
    @Autowired
    VeService veService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<Ve> veList = veService.findAll();
        return ResponseEntity.ok(veList);
    }
}
