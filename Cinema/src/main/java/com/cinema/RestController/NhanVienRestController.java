package com.cinema.RestController;

import com.cinema.Entity.NhanVien;
import com.cinema.Services.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/NhanVien")
public class NhanVienRestController {
    @Autowired
    NhanVienService nhanVienService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<NhanVien> nhanVien = nhanVienService.findAll();
        return ResponseEntity.ok(nhanVien);
    }

    @PostMapping("/create")
    public ResponseEntity<NhanVien> create(@RequestBody NhanVien nhanVien) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (nhanVienService.existsById(nhanVien.getMaNV())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        NhanVien addeNV = nhanVienService.addEmployee(nhanVien);
        return new ResponseEntity<>(addeNV, HttpStatus.CREATED);
    }

    @DeleteMapping("/{stt}")
    public ResponseEntity<Void> deleteNV(@PathVariable String maNV) {
        nhanVienService.deleteEmployee(maNV);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{stt}")
    public ResponseEntity<NhanVien> updateNgayChieu(@PathVariable String maNV, @RequestBody NhanVien updatedNV) {
        NhanVien result = nhanVienService.updateEmployee(maNV, updatedNV);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
