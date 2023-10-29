package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
