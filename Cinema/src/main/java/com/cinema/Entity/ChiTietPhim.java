package com.cinema.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "ChiTietPhim")
public class ChiTietPhim{
    @Id
    @ManyToOne
    @JoinColumn(name = "MaPhim")
    private Phim phim;
    @Id
    @ManyToOne
    @JoinColumn(name = "MaTheLoai")
    private TheLoaiPhim theLoaiPhim;
}
