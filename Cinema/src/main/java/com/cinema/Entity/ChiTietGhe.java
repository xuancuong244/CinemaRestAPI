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
	@Column(name = "Ma_CTGhe")
	private Integer maCTGhe;

	@Column(name = "Ma_Phong")
	private String maPhong;
	@ManyToOne
	@JoinColumn(name = "Ma_Ghe")
	private Ghe ghe;
}
