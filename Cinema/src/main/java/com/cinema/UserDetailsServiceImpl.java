//package com.cinema;
//
//import com.cinema.Entity.KhachHang;
//import com.cinema.Entity.NhanVien;
//import com.cinema.Reponsitory.KhachHangReponsitory;
//import com.cinema.Reponsitory.NhanVienReponsitory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//@Service
//public class UserDetailsServiceImpl implements UserDetailsService {
//
//    @Autowired
//    private NhanVienReponsitory nhanVienRepository;
//
//    @Autowired
//    private KhachHangReponsitory khachHangRepository;
//
//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        NhanVien nhanVien = nhanVienRepository.findByEmail(email);
//        KhachHang khachHang = khachHangRepository.findByEmail(email);
//
//        if (nhanVien != null) {
//            return UserDetailsImpl.buildForNhanVien(nhanVien);
//        } else if (khachHang != null) {
//            return UserDetailsImpl.buildForKhachHang(khachHang);
//        } else {
//            throw new UsernameNotFoundException("Không tìm thấy người dùng với email: " + email);
//        }
//    }
//}
