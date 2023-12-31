package com.cinema.Services;

import com.cinema.Entity.KhachHang;

import java.util.List;
import java.util.Optional;

public interface KhachHangService {
    List<KhachHang> findAll();
    KhachHang findByEmailAndMatKhau(String email, String matKhau);
    KhachHang findByEmail(String email);

    KhachHang save(KhachHang khachHang);

    Optional<KhachHang> findById(Integer userId);
    boolean existsById(Integer userId);

    void deleteCustomer(int customerId);

    KhachHang updateCustomer(int customerId, KhachHang updatedCustomer);

    KhachHang addCustomer(KhachHang customer);
}
