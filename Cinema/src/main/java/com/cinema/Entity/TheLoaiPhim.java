package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "THELOAI")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "THELOAI")
public class TheLoaiPhim {
	@Id
    @Column(name = "maTheLoai")
    private String maTheLoai;
    @Column(name = "tenTheLoai")
    private String tenTheLoai;
    @JsonIgnore
    @OneToMany(mappedBy = "theLoai")
    List<ChiTietPhim> chiTietPhimList;
}
