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
@Table(name = "LoaiGhe")
public class LoaiGhe implements Serializable {
    @Id
    private Integer maLoai;
    private String tenLoai;
    private Float phuThu;
    @JsonIgnore
    @OneToMany(mappedBy = "loaiGhe")
    List<Ghe> gheList;
}
