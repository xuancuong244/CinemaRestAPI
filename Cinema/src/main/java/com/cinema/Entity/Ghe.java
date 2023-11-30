package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "Ghe")
public class Ghe {
	@Id
    @Column(name = "ma_ghe")
    private String maGhe;
    @Column(name = "ten_ghe")
    private String tenGhe;
    @Column(name = "ma_loai")
    private Integer maLoai;
}
