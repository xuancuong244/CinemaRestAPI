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

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "LOAIGHE")
public class LoaiGhe {
	@Id
    @Column(name = "maLoai")
    private Integer maLoai;
    @Column(name = "tenLoai")
    private String tenLoai;
    @Column(name = "phuThu")
    private Float phuThu;
    @JsonIgnore
    @OneToMany(mappedBy = "loaiGhe")
    List<Ghe> gheList;
}
