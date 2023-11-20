package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chi_tiet_phim")
public class ChiTietPhim implements Serializable {


    @Id
    @ManyToOne
    @JoinColumn(name = "ma_phim")
    private Phim phim;
    @Id
    @ManyToOne
    @JoinColumn(name = "ma_the_loai")
    private TheLoaiPhim theLoaiPhim;

}
