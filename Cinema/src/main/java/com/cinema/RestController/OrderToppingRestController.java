package com.cinema.RestController;

import com.cinema.Entity.OrderTopping;
import com.cinema.Services.OrderToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin("*")
@RestController
@RequestMapping("/api/OrderTopping")
public class OrderToppingRestController {
    @Autowired
    OrderToppingService orderToppingService;

    @GetMapping("/all")
    public ResponseEntity<?> doGetAll(){
        List<OrderTopping> orderToppings = orderToppingService.findAll();
        return ResponseEntity.ok(orderToppings);
    }

    @PostMapping("/create")
    public ResponseEntity<OrderTopping> createKhachHang(@RequestBody OrderTopping topping) {
        // Kiểm tra nếu mã khách hàng đã tồn tại
        if (orderToppingService.existsById(topping.getMaTopping())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
        OrderTopping addTopping = orderToppingService.addTopping(topping);
        return new ResponseEntity<>(addTopping, HttpStatus.CREATED);
    }

    @DeleteMapping("/{maTopping}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable String maTopping) {
        orderToppingService.deleteTopping(maTopping);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/{maTopping}")
    public ResponseEntity<OrderTopping> updateCustomer(@PathVariable String maTopping, @RequestBody OrderTopping updatedTopping) {
        OrderTopping result = orderToppingService.updateTopping(maTopping, updatedTopping);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
