package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChucVu")
public class ChucVu implements Serializable {
    @Id
    @Column(name = "maCV")
    private String maCV;

    @Column(name = "tenCV")
    private String tenCV;
    @JsonIgnore
    @OneToMany(mappedBy = "chucVu")
    List<NhanVien> nhanVienList;
}
