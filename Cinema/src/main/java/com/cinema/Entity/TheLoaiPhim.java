package com.cinema.Entity;

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
@Table(name = "the_loai")
public class TheLoaiPhim {
	@Id
    @Column(name = "ma_the_loai")
    private String maTheLoai;
    @Column(name = "ten_the_loai")
    private String tenTheLoai;

}
