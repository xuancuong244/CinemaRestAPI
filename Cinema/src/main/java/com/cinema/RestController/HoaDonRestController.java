package com.cinema.RestController;

import com.cinema.Entity.HoaDon;
import com.cinema.Services.HoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/hoadon")
public class HoaDonRestController {
    @Autowired
    private HoaDonService hoaDonService;

    @GetMapping("/by-tennguoidung/{tenNguoiDung}")
    public ResponseEntity<List<HoaDon>> getHoaDonByTenNguoiDung(@PathVariable String tenNguoiDung) {
        List<HoaDon> hoaDons = hoaDonService.findByUsername(tenNguoiDung);
        if (hoaDons.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity<>(hoaDons, HttpStatus.OK);
        }
    }

    @PostMapping("/create")
    public ResponseEntity<HoaDon> createHoaDon(@RequestBody HoaDon hoaDon) {
        HoaDon createdHoaDon = hoaDonService.create(hoaDon);
        return new ResponseEntity<>(createdHoaDon, HttpStatus.CREATED);
    }
}
