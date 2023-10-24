package com.cinema.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "CHITIETPHIM")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CHITIETPHIM")
public class ChiTietPhim{
	@Id
    private String maPhim;

    @Id
    private String maTheLoai;

    @ManyToOne
    @JoinColumn(name = "theLoaiI"
    		+ "d")
    private TheLoaiPhim theLoai;
    @ManyToOne
    @JoinColumn(name = "phimId")
    private Phim phim;
}
