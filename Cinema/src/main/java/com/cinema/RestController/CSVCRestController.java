package com.cinema.RestController;

import com.cinema.Entity.CSVC;
import com.cinema.Services.CoSoVatChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/CSVC")
public class CSVCRestController {
    @Autowired
    CoSoVatChatService coSoVatChatService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<CSVC> csvcs = coSoVatChatService.findAll();
        return ResponseEntity.ok(csvcs);
    }
}
