package com.cinema.RestController;

import com.cinema.Entity.Quyen;
import com.cinema.Services.QuyenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/quyen")
public class QuyenRestController {
    @Autowired
    QuyenService quyenService;

    @GetMapping()
    public ResponseEntity<?> doGetAll(@RequestParam("admin") Optional<Boolean> admin) {
        if (admin.orElse(false)){
            List<Quyen> quyens = quyenService.findAuthoritiesOfAdministrators();
            return ResponseEntity.ok(admin);
        }
        List<Quyen> authorities = quyenService.findAll();
        // http status code: 200, 201, 202, 400, 401, 403, 404, 500
        return ResponseEntity.ok(authorities);

    }

    @PostMapping
    public ResponseEntity<?> post(@RequestBody Quyen quyen){
        quyenService.create(quyen);
        return ResponseEntity.ok(quyen);
    }

    @DeleteMapping("{id}")
    public ResponseEntity<?> delete(@PathVariable("id") Integer id){
        quyenService.delete(id);
        return ResponseEntity.ok().build();
    }
}
