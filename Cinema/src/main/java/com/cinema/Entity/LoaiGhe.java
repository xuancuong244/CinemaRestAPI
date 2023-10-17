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
@Table(name = "LoaiGhe")
public class LoaiGhe implements Serializable {
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
