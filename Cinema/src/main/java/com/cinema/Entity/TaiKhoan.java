package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tai_khoan")
public class TaiKhoan {
    @Id
    @Column(name = "username")
    private String username;

    @Column(name = "mat_khau")
    private String matKhau;

    @Column(name = "so_dt")
    private String soDT;
    @Column(name = "ho_ten")
    private String hoTen;

    @JsonIgnore
    @OneToMany(mappedBy = "taiKhoan", fetch = FetchType.EAGER)
    private List<Quyen> quyens;

    public String getHoTen() {
        System.out.println("HoTen: " + hoTen);
        return hoTen;
    }
}
