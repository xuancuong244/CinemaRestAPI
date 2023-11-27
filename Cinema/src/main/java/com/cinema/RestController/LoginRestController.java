package com.cinema.RestController;

import com.cinema.DTO.RegisterRequest;
import com.cinema.Entity.KhachHang;
import com.cinema.DTO.LoginRequest;
import com.cinema.DTO.LoginResponse;
import com.cinema.Entity.NhanVien;
import com.cinema.Reponsitory.KhachHangReponsitory;
import com.cinema.Reponsitory.NhanVienReponsitory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class LoginRestController {

    @Autowired
    private NhanVienReponsitory nhanVienRepository; // Tùy chỉnh tên repository và service theo cấu trúc của bạn
    @Autowired
    private KhachHangReponsitory khachHangRepository;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest, HttpSession session) {
        String email = loginRequest.getEmail();
        String matKhau = loginRequest.getPassword();

        // Xác thực thông tin đăng nhập
        NhanVien nhanVien = nhanVienRepository.findByEmailAndMatKhau(email,matKhau);
        KhachHang khachHang = khachHangRepository.findByEmailAndMatKhau(email, matKhau);

        if (nhanVien != null) {
            session.setAttribute("loggedIn", true);
            session.setAttribute("userRole", "nhan_vien");
            // Lưu thêm thông tin khác nếu cần
            session.setAttribute("userId", nhanVien.getMaNV()); // lưu ID của nhân viên
            return ResponseEntity.ok(new LoginResponse("nhan_vien"));
        } else if (khachHang != null) {
            session.setAttribute("loggedIn", true);
            session.setAttribute("userRole", "khach_hang");
            // Lưu thêm thông tin khác nếu cần
            session.setAttribute("userId", khachHang.getMaKH()); // lưu ID của khách hàng
            return ResponseEntity.ok(new LoginResponse("khach_hang"));
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Đăng nhập không thành công. Kiểm tra lại thông tin đăng nhập");
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest registerRequest) {
        // Kiểm tra xem email đã được đăng ký trước đó chưa
        if (khachHangRepository.existsByEmail(registerRequest.getEmail())) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("Email đã được sử dụng. Vui lòng chọn email khác.");
        }

        // Tạo mới đối tượng KhachHang từ dữ liệu đăng ký
        KhachHang khachHang = new KhachHang();
        khachHang.setTenKH(registerRequest.getHoTen());
        khachHang.setEmail(registerRequest.getEmail());
        khachHang.setSoDT(registerRequest.getSoDienThoai());
        khachHang.setGioiTinh(registerRequest.getGioiTinh());
        khachHang.setMatKhau(registerRequest.getMatKhau());

        // Lưu đối tượng vào database
        khachHangRepository.save(khachHang);

        return ResponseEntity.ok("Đăng ký thành công");
    }
}

