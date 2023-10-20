package com.cinema.RestController;

import com.cinema.Entity.ChiNhanh;
import com.cinema.Services.ChiNhanhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/ChiNhanh")
public class ChiNhanhRestController {

    @Autowired
    ChiNhanhService chiNhanhService;
    // http method: GET, POST, PUT, DELETE

    // localhost:8085/api/ChiNhanh/all
    @GetMapping()
    public ResponseEntity<?> doGetAll(){
        List<ChiNhanh> chiNhanh = chiNhanhService.findAll();
        return ResponseEntity.ok(chiNhanh);
    }

}
