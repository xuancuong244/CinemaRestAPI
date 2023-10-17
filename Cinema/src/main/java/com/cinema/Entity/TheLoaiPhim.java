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
@Table(name = "TheLoai")
public class TheLoaiPhim implements Serializable {
    @Id
    @Column(name = "maTheLoai")
    private String maTheLoai;
    @Column(name = "tenTheLoai")
    private String tenTheLoai;
    @JsonIgnore
    @OneToMany(mappedBy = "theLoai")
    List<ChiTietPhim> chiTietPhimList;
}
