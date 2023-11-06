package com.cinema.RestController;

import com.cinema.Entity.XuatChieu;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
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

//    @GetMapping("/ngayChieu")
//    public ResponseEntity<?> getXuatChieuByNgayChieu(@RequestParam(name = "ngayChieu") String ngayChieuString) throws ParseException {
//        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
//        Date ngayChieu = sdf.parse(ngayChieuString);
//        List<XuatChieu> xuatChieus = xuatChieuService.findXuatChieuByNgayChieu(ngayChieu);
//        return ResponseEntity.ok(xuatChieus);
//    }
}
