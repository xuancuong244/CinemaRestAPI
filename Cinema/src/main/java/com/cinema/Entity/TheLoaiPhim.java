package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TheLoai")
public class TheLoaiPhim implements Serializable {
    @Id
    private String maTheLoai;
    private String tenTheLoai;
    @JsonIgnore
    @OneToMany(mappedBy = "theLoai")
    List<ChiTietPhim> chiTietPhimList;
}
