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
@Table(name = "topping")
public class OrderTopping {
	@Id
    @Column(name = "ma_topping")
    private String maTopping;
    @Column(name = "ten_topping")
    private String tenTopping;
    @Column(name = "so_luong_dang_co")
    private Integer soLuongDangCo;
    @Column(name = "gia")
    private Float gia;
    @Column(name = "hinh")
    private String hinh;
    @JsonIgnore
    @OneToMany(mappedBy = "topping")
    private List<ChiTietTopping> chiTietToppingList;
}
