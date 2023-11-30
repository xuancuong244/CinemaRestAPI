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
@Table(name = "ChiTietGhe")
public class ChiTietGhe{
	@Id
	@Column(name = "ma_ctghe")
	private Integer maCTGhe;

	@Column(name = "ma_phong")
	private String maPhong;
	@ManyToOne
	@JoinColumn(name = "ma_ghe")
	private Ghe ghe;
}
