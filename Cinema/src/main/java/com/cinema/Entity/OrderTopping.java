package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
