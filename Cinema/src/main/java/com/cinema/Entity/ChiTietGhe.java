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

@Entity(name = "CHITIETGHE")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CHITIETGHE")
public class ChiTietGhe{
	@Id
	@Column(name = "MACTGHE")
	private Integer maCTGhe;

	@Column(name = "MAPHONG")
	private String maPhong;

	@Column(name = "MAGHE")
	private String maGhe;

	@ManyToOne
	@JoinColumn(name = "gheId")
	private Ghe ghe;

	@ManyToOne
	@JoinColumn(name = "phongChieuId")
	private PhongChieu phongChieu;

	@JsonIgnore
	@OneToMany(mappedBy = "chiTietGhe")
	private List<Ve> veList;
}
