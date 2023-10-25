package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "GHE")
public class Ghe {
	@Id
    @Column(name = "maGhe")
    private String maGhe;
    @Column(name = "tenGhe")
    private String tenGhe;
    @Column(name = "maLoai")
    private Integer maLoai;
    @ManyToOne
    @JoinColumn(name = "loaiGheId")
    private LoaiGhe loaiGhe;
    @JsonIgnore
    @OneToMany(mappedBy = "ghe")
    private List<ChiTietGhe> chiTietGhe;
}
