package com.cinema.RestController;

import com.cinema.Entity.Ve;
import com.cinema.Services.VeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/Ve")
public class VeRestController {
    @Autowired
    VeService veService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<Ve> veList = veService.findAll();
        return ResponseEntity.ok(veList);
    }

    @PostMapping("/create")
    public ResponseEntity<Ve> createKhachHang(@RequestBody Ve ve) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (veService.existsById(ve.getIdVe())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        Ve addVe = veService.addVe(ve);
        return new ResponseEntity<>(addVe, HttpStatus.CREATED);
    }

    @DeleteMapping("/{idVe}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable int idVe) {
        veService.deleteVe(idVe);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{idVe}")
    public ResponseEntity<Ve> updateVe(@PathVariable int idVe, @RequestBody Ve updatedVe) {
        Ve result = veService.updateVe(idVe, updatedVe);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
