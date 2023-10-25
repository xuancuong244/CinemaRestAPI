package com.cinema.RestController;

import com.cinema.Entity.Ghe;
import com.cinema.Services.GheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Ghe")
public class GheRestController {
    @Autowired
    GheService gheService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<Ghe> ghes = gheService.findAll();
        return ResponseEntity.ok(ghes);
    }
}
