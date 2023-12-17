package com.cinema.RestController;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.cinema.Entity.YourDataModel;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ThongKeController {
    @PostMapping("/api/ThongKe/all")
    public ResponseEntity<Map<String, String>> receiveData(@RequestBody(required = false) YourDataModel data) {
        if (data != null) {
            // Xử lý dữ liệu ở đây
            System.out.println("Received data from client: " + data.getSelectedSeatsInfo());

            // Trả về một đối tượng JSON với thông điệp
            Map<String, String> response = new HashMap<>();
            response.put("message", "Data received successfully");

            return ResponseEntity.ok(response);
        } else {
            // Xử lý trường hợp data là null
            // Ví dụ: trả về thông điệp lỗi
            Map<String, String> response = new HashMap<>();
            response.put("error", "Received data is null");

            return ResponseEntity.badRequest().body(response);
        }
    }

//    public ResponseEntity<Map<String, String>> receiveData(@RequestBody YourDataModel data) {
//        // Xử lý dữ liệu ở đây
//        System.out.println("Received data from client: " + data.getSelectedMovieInfo());
//
//        // Trả về một đối tượng JSON với thông điệp
//        Map<String, String> response = new HashMap<>();
//        response.put("message", "Data received successfully");
//
//        return ResponseEntity.ok(response);
//    }

//    public ResponseEntity<String> receiveData(@RequestBody YourDataModel data) {
//        // Xử lý dữ liệu ở đây
//        System.out.println("Received data from client: " + data.getSelectedMovieInfo());
//
//        // Trả về phản hồi
//        return ResponseEntity.ok("Data received successfully");
//    }
}
