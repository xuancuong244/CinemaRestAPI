//package com.cinema.RestController;
//
//import com.cinema.Entity.ChiTietPhim;
//import com.cinema.Entity.Phim;
//import com.cinema.Services.ChiTietPhimService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//import java.util.Optional;
//
//@CrossOrigin("*")
//@RestController
//@RequestMapping("/api/ChiTietPhim")
//public class ChiTietPhimRestController {
//    @Autowired
//    ChiTietPhimService chiTietPhimService;
//
//    @GetMapping("/all")
//    public ResponseEntity<?> doGetAll(){
//        List<ChiTietPhim> phims = chiTietPhimService.findAll();
//        return ResponseEntity.ok(phims);
//    }
//
//    @GetMapping("/{maPhim}")
//    public ResponseEntity<?> getByMaPhim(@PathVariable String maPhim){
//        Optional<ChiTietPhim> phims = chiTietPhimService.findById(maPhim);
//        if (phims.isPresent()){
//            return ResponseEntity.ok(phims.get());
//        }else{
//            return ResponseEntity.notFound().build();
//        }
//    }
//}
