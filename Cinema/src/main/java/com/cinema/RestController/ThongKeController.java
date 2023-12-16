package com.cinema.RestController;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.cinema.Entity.YourDataModel;
@RestController
public class ThongKeController {
    @PostMapping("/api/ThongKe/all")
    public String receiveData(@RequestBody YourDataModel data) {
        // Xử lý dữ liệu ở đây, ví dụ: in ra console
        System.out.println("Received data from client: " + data.getData());

        // Trả về phản hồi
        return "Data received successfully!";
    }
}
