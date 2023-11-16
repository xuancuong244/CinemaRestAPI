package com.cinema.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterRequest {
    private String hoTen;
    private String email;
    private String soDienThoai;
    private Boolean gioiTinh;
    private String matKhau;
}
