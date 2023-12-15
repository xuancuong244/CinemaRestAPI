package com.cinema.Services.implServices;

import com.cinema.Entity.KhachHang;
import com.cinema.Reponsitory.KhachHangReponsitory;
import com.cinema.Services.KhachHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class KhachHangServiceImpl implements KhachHangService {
    @Autowired
    KhachHangReponsitory khachHangReponsitory;

    @Override
    public List<KhachHang> findAll() {
        return khachHangReponsitory.findAll();
    }

    @Override
    public KhachHang findByEmailAndMatKhau(String email, String matKhau) {
        return khachHangReponsitory.findByEmailAndMatKhau(email,matKhau);
    }

    @Override
    public KhachHang findByEmail(String email) {
        return khachHangReponsitory.findByEmail(email);
    }

    @Override
    public KhachHang save(KhachHang khachHang) {
        return khachHangReponsitory.save(khachHang);
    }

    @Override
    public Optional<KhachHang> findById(Integer userId) {
        return khachHangReponsitory.findById(userId);
    }

    @Override
    public boolean existsById(Integer userId) {
        return khachHangReponsitory.existsById(userId);
    }

    @Override
    public void deleteCustomer(int customerId) {
        khachHangReponsitory.deleteById(customerId);
    }
    @Override
    public KhachHang updateCustomer(int customerId, KhachHang updatedCustomer) {
        KhachHang existingCustomer = khachHangReponsitory.findById(customerId)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm KH với ID: " + customerId));

        // Cập nhật thông tin Khách hàng
        existingCustomer.setMaKH(updatedCustomer.getMaKH());
        existingCustomer.setTenKH(updatedCustomer.getTenKH());
        existingCustomer.setMatKhau(updatedCustomer.getMatKhau());
        existingCustomer.setEmail(updatedCustomer.getEmail());
        existingCustomer.setSoDT(updatedCustomer.getSoDT());
        existingCustomer.setDiaChi(updatedCustomer.getDiaChi());
        existingCustomer.setGioiTinh(updatedCustomer.getGioiTinh());

        // Lưu vào cơ sở dữ liệu
        return khachHangReponsitory.save(existingCustomer);
    }

    @Override
    public KhachHang addCustomer(KhachHang customer) {
        // Tự động tăng maKH
        customer.setMaKH(0);
        return khachHangReponsitory.save(customer);
    }
}
