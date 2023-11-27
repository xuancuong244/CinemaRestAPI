package com.cinema.RestController;

import com.cinema.Entity.ChiNhanh;
import com.cinema.Services.ChiNhanhService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/chinhanh")
public class ChiNhanhRestController {
    @Autowired
    ChiNhanhService chiNhanhService;
    // http method: GET, POST, PUT, DELETE

    // localhost:8085/api/ChiNhanh/all
    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(@RequestParam(required = false) String maCN){
        if (maCN != null){
            Optional<ChiNhanh> chiNhanh = chiNhanhService.findById(maCN);
            return ResponseEntity.ok(chiNhanh);
        }else{
            List<ChiNhanh> chiNhanh = chiNhanhService.findAll();
            return ResponseEntity.ok(chiNhanh);
        }
    }

    @GetMapping("/{maCN}")
    public ResponseEntity<?> doGetOne(@PathVariable String maCN){
        Optional<ChiNhanh> chiNhanh = chiNhanhService.findById(maCN);
        if(chiNhanh.isPresent()){
            return ResponseEntity.ok(chiNhanh.get());
        }else {
            return ResponseEntity.notFound().build();
        }
    }


    @PostMapping
    public ResponseEntity<?> create(@RequestBody ChiNhanh chiNhanh){
        chiNhanhService.create(chiNhanh);
        return ResponseEntity.ok(chiNhanh);
    }

    @PutMapping({"/maCN"})
    public ResponseEntity<?> update(@PathVariable("maCN") String maCN,@RequestBody ChiNhanh chiNhanh){
        chiNhanhService.update(chiNhanh);
        return ResponseEntity.ok(chiNhanh);
    }

}
