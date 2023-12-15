package com.cinema.RestController;

import com.cinema.Entity.XuatChieu;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/XuatChieu")
public class XuatChieuRestController {
    @Autowired
    XuatChieuService xuatChieuService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<XuatChieu> xuatChieus = xuatChieuService.findAll();
        return  ResponseEntity.ok(xuatChieus);
    }

    @GetMapping("/maPhim")
    public ResponseEntity<?> getXuatChieuByMaPhim(@RequestParam("maPhim") String maPhim){
        List<XuatChieu> xuatChieus = xuatChieuService.findByMaPhim(maPhim);
        return ResponseEntity.ok(xuatChieus);
    }
    @PostMapping("/create")
    public ResponseEntity<XuatChieu> createSC(@RequestBody XuatChieu sc) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (xuatChieuService.existsById(sc.getStt())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        XuatChieu addedCustomer = xuatChieuService.addSC(sc);
        return new ResponseEntity<>(addedCustomer, HttpStatus.CREATED);
    }

    @DeleteMapping("/{stt}")
    public ResponseEntity<Void> deleteSC(@PathVariable int stt) {
        xuatChieuService.deleteSC(stt);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{stt}")
    public ResponseEntity<XuatChieu> updateCustomer(@PathVariable int stt, @RequestBody XuatChieu updateSC) {
        XuatChieu result = xuatChieuService.updateSC(stt, updateSC);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}
