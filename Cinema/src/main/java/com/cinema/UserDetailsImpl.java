//package com.cinema;
//
//import com.cinema.Entity.KhachHang;
//import com.cinema.Entity.NhanVien;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.Collection;
//import java.util.Collections;
//import java.util.List;
//
//public class UserDetailsImpl implements UserDetails {
//    private Long id;
//    private String email;
//    private String password;
//    private Collection<? extends GrantedAuthority> authorities;
//
//    public static UserDetailsImpl buildForNhanVien(NhanVien nhanVien) {
//        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_NHAN_VIEN"));
//
//        return new UserDetailsImpl(
//                nhanVien.getMaNV(),
//                nhanVien.getEmail(),
//                nhanVien.getMatKhau(),
//                authorities
//        );
//    }
//
//    public static UserDetailsImpl buildForKhachHang(KhachHang khachHang) {
//        List<GrantedAuthority> authorities = Collections.singletonList(new SimpleGrantedAuthority("ROLE_KHACH_HANG"));
//
//        return new UserDetailsImpl(
//                khachHang.getMaKH().toString(), // Chú ý chuyển đổi Integer thành String
//                khachHang.getEmail(),
//                khachHang.getMatKhau(),
//                authorities
//        );
//    }
//
//    private UserDetailsImpl(String id, String email, String password, Collection<? extends GrantedAuthority> authorities) {
//        this.id = Long.valueOf(id);
//        this.email = email;
//        this.password = password;
//        this.authorities = authorities;
//    }
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        return authorities;
//    }
//
//    @Override
//    public String getPassword() {
//        return password;
//    }
//
//    @Override
//    public String getUsername() {
//        return email;
//    }
//
//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return true;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return true;
//    }
//}
