package com.cinema.RestController;

import com.cinema.Entity.NgayChieu;
import com.cinema.Services.NgayChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin("*")
@RestController
@RequestMapping("/api/NgayChieu")
public class NgayChieuRestController {
    @Autowired
    NgayChieuService ngayChieuService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<NgayChieu> ngayChieus = ngayChieuService.findAll();
        return ResponseEntity.ok(ngayChieus);
    }

    @GetMapping("/maPhim")
    public ResponseEntity<?> getNgayChieuByMaPhim(@RequestParam("maPhim") String maPhim){
        List<NgayChieu> ngayChieus = ngayChieuService.findByPhim_MaPhim(maPhim);
        return ResponseEntity.ok(ngayChieus);
    }

    @PostMapping("/create")
    public ResponseEntity<NgayChieu> create(@RequestBody NgayChieu ngayChieu) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (ngayChieuService.existsById(ngayChieu.getStt())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        NgayChieu addedNgayChieu = ngayChieuService.addNgayChieu(ngayChieu);
        return new ResponseEntity<>(addedNgayChieu, HttpStatus.CREATED);
    }

    @DeleteMapping("/{stt}")
    public ResponseEntity<Void> deleteNgayChieu(@PathVariable int stt) {
        ngayChieuService.deleteNgayChieu(stt);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{stt}")
    public ResponseEntity<NgayChieu> updateNgayChieu(@PathVariable int stt, @RequestBody NgayChieu updatedNgayChieu) {
        NgayChieu result = ngayChieuService.updateNgayChieu(stt, updatedNgayChieu);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
