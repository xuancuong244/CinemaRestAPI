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
@Table(name = "Ghe")
public class Ghe implements Serializable {
    @Id
    private String maGhe;
    private String tenGhe;
    private Integer maLoai;
    @ManyToOne
    @JoinColumn(name = "loaiGheId")
    private LoaiGhe loaiGhe;
    @JsonIgnore
    @OneToMany(mappedBy = "ghe")
    private List<ChiTietGhe> chiTietGhe;
}
