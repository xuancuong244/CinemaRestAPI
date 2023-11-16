package com.cinema.Services.implServices;

import com.cinema.Entity.TaiKhoan;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
// implements UserDetailsService
public class UserDetailsServiceImpl{
//    @Autowired
//    private TaiKhoanService taiKhoanService;
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        TaiKhoan taiKhoan = taiKhoanService.findTaiKhoanByUsername(username)
//                .orElseThrow(() -> new UsernameNotFoundException("Không tìm thấy người dùng: " + username));
//
//        List<GrantedAuthority> authorities = new ArrayList<>();
//
//        // Kiểm tra giá trị roles để xác định quyền
//        if (taiKhoan.getRoles() != null) {
//            String rolePrefix = "ROLE_"; // Tiền tố của quyền
//
//            if (taiKhoan.getRoles().equals("CV1")) {
//                authorities.add(new SimpleGrantedAuthority(rolePrefix + "KHACH_HANG"));
//            } else if (taiKhoan.getRoles().equals("CV7")) {
//                authorities.add(new SimpleGrantedAuthority(rolePrefix + "QUAN_TRI"));
//            }
//        }
//
//        return new User(taiKhoan.getUsername(), taiKhoan.getPassword(), authorities);
//    }
}

