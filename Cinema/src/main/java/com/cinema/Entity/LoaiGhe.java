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
@Table(name = "loai_ghe")
public class LoaiGhe {
	@Id
    @Column(name = "Ma_Loai")
    private Integer maLoai;
    @Column(name = "Ten_Loai")
    private String tenLoai;
    @Column(name = "Phu_Thu")
    private Float phuThu;
}
