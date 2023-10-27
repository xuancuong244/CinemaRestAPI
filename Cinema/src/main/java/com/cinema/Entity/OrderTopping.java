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
@Table(name = "Topping")
public class OrderTopping {
	@Id
    @Column(name = "MaTopping")
    private String maTopping;
    @Column(name = "TenTopping")
    private String tenTopping;
    @Column(name = "SoLuongDangCo")
    private Integer soLuongDangCo;
    @Column(name = "Gia")
    private Float gia;
    @Column(name = "Hinh")
    private String hinh;
    @JsonIgnore
    @OneToMany(mappedBy = "topping")
    private List<ChiTietTopping> chiTietToppingList;
}
