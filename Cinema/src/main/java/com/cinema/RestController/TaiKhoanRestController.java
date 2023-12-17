package com.cinema.RestController;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    @GetMapping("/{username}")
    public ResponseEntity<?> doGetOne(@PathVariable String username) {
        Optional<TaiKhoan> optionalTaiKhoan = taiKhoanService.findTaiKhoanByHoTen(username);

        if (optionalTaiKhoan.isPresent()) {
            TaiKhoan taiKhoan = optionalTaiKhoan.get();
            return ResponseEntity.ok(taiKhoan);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @PostMapping("/create")
    public ResponseEntity<TaiKhoan> createKhachHang(@RequestBody TaiKhoan username) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (taiKhoanService.existsById(username.getUsername())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        TaiKhoan addedTaiKhoan = taiKhoanService.addTaiKhoan(username);
        return new ResponseEntity<>(addedTaiKhoan, HttpStatus.CREATED);
    }

    @DeleteMapping("/{username}")
    public ResponseEntity<Void> deleteTaiKhoan(@PathVariable String username) {
        taiKhoanService.deleteTaiKhoan(username);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{username}")
    public ResponseEntity<TaiKhoan> update(@PathVariable String username, @RequestBody TaiKhoan updatedTaiKhoan) {
        TaiKhoan result = taiKhoanService.updateTaiKhoan(username, updatedTaiKhoan);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }


}
