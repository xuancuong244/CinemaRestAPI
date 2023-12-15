package com.cinema.RestController;

import com.cinema.Entity.KhachHang;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/KhachHang")
public class KhachHangRestController {
    @Autowired
    KhachHangService khachHangService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<KhachHang> khachHangs = khachHangService.findAll();
        return ResponseEntity.ok(khachHangs);
    }

    @GetMapping("/{maKH}")
    public ResponseEntity<?> doGetOne(@PathVariable Integer maKH){
        Optional<KhachHang> khachHangs = khachHangService.findById(maKH);
        return ResponseEntity.ok(khachHangs);
    }

    @PostMapping("/create")
    public ResponseEntity<KhachHang> createKhachHang(@RequestBody KhachHang khachHangs) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (khachHangService.existsById(khachHangs.getMaKH())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        KhachHang addedCustomer = khachHangService.addCustomer(khachHangs);
        return new ResponseEntity<>(addedCustomer, HttpStatus.CREATED);
    }

    @DeleteMapping("/{maKH}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable int maKH) {
        khachHangService.deleteCustomer(maKH);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{maKH}")
    public ResponseEntity<KhachHang> updateCustomer(@PathVariable int maKH, @RequestBody KhachHang updatedCustomer) {
        KhachHang result = khachHangService.updateCustomer(maKH, updatedCustomer);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
