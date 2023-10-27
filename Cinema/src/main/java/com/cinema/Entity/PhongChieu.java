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
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "PhongChieu")
public class PhongChieu {
	@Id
    @Column(name = "MaPhong")
    private String maPhong;
    @Column(name = "TenPhong")
    private String tenPhong;
    @ManyToOne
    @JoinColumn(name = "MaCN")
    private ChiNhanh chiNhanh;
}
