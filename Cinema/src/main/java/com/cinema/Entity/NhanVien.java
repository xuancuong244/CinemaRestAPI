package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "NhanVien")
public class NhanVien implements Serializable {
    @Id
    private String maNV;
    private String hoTen;
    private Integer gioiTinh;
    private String matKhau;
    private Date ngaySinh;
    private String soDT;
    @ManyToOne
    @JoinColumn(name = "chucVuId")
    ChucVu chucVu;
    @JsonIgnore
    @OneToMany(mappedBy = "nhanVien")
    List<LichLamViec> lichLamViecList;
}
