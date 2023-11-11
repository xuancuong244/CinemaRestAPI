package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "phong_chieu")
public class PhongChieu {
	@Id
    @Column(name = "Ma_Phong")
    private String maPhong;
    @Column(name = "Ten_Phong")
    private String tenPhong;
    @ManyToOne
    @JoinColumn(name = "Ma_CN")
    private ChiNhanh chiNhanh;
}
