package com.cinema.RestController;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/taiKhoan")
public class TaiKhoanRestController {
    @Autowired
    TaiKhoanService taiKhoanService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(@RequestParam("admin") Optional<Boolean> admin) {
        if (admin.orElse(false)){
            List<TaiKhoan> taiKhoans = taiKhoanService.getAdmin();
            return ResponseEntity.ok(taiKhoans);
        }
        List<TaiKhoan> taiKhoans = taiKhoanService.findAll();
        return ResponseEntity.ok(taiKhoans);
    }


}
