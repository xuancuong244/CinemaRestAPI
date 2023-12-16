package com.cinema.RestController;

import com.cinema.Entity.Phim;
import com.cinema.Entity.TheLoaiPhim;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Phim")
public class PhimRestController {
    @Autowired
    PhimService phimService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<Phim> phims = phimService.findAll();
        return ResponseEntity.ok(phims);
    }

//    @GetMapping("/{maPhim}/theLoai")
//    public ResponseEntity<?> getGenresByMaPhim(@PathVariable String maPhim) {
//        Optional<Phim> phim = phimService.findById(maPhim);
//        if (phim.isPresent()) {
//            List<TheLoaiPhim> genres = phim.get().getTheLoai();
//            return ResponseEntity.ok(genres);
//        } else {
//            return ResponseEntity.notFound().build();
//        }
//    }

    @GetMapping("/{maPhim}")
    public ResponseEntity<?> getByMaPhim(@PathVariable String maPhim){
        Optional<Phim> phim = phimService.findById(maPhim);
        if (phim.isPresent()){
            return ResponseEntity.ok(phim.get());
        }else{
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/trangThai/{trangThai}")
    public ResponseEntity<?> getByTrangThaiPhim(@PathVariable("trangThai") String trangThai){
        List<Phim> phims = phimService.findPhimByTrangThai(trangThai);
        return ResponseEntity.ok(phims);
    }

    // Thêm
    @PostMapping("/create")
    public ResponseEntity<?> addPhim(@RequestBody Phim phim) {
        String maPhim = phim.getMaPhim();

        // Kiểm tra xem mã phim đã tồn tại chưa
        if (phimService.isMaPhimExisted(maPhim)) {
            return new ResponseEntity<>("Mã phim đã tồn tại!", HttpStatus.BAD_REQUEST);
        }

        // Tiếp tục thêm phim mới nếu mã phim chưa tồn tại
        Phim addedPhim = phimService.addPhim(phim);

        return new ResponseEntity<>(addedPhim, HttpStatus.CREATED);
    }

    // Xóa
    @DeleteMapping("/{maPhim}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable String maPhim) {
        phimService.delete(maPhim);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    // Update
    @PutMapping("/{maPhim}")
    public ResponseEntity<Phim> update(@PathVariable String maPhim, @RequestBody Phim updatedPhim) {
        Phim result = phimService.update(maPhim, updatedPhim);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}


