package com.cinema.RestController;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/TaiKhoan")
public class TaiKhoanRestController {
    @Autowired
    TaiKhoanService taiKhoanService;

//    @GetMapping()
//    public ResponseEntity<?> doGetAll(@RequestParam("admin") Optional<Boolean> admin) {
//        if (admin.orElse(false)){
//            List<TaiKhoan> taiKhoan = taiKhoanService.getAdministrators();
//            return ResponseEntity.ok(taiKhoan);
//        }
//        List<TaiKhoan> account = taiKhoanService.findAll();
//        // http status code: 200, 201, 202, 400, 401, 403, 404, 500
//        return ResponseEntity.ok(account);
//    }
}
