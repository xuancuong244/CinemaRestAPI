package com.cinema.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Topping")
public class OrderTopping implements Serializable {
    @Id
    @Column(name = "MaTopping")
    private String maTopping;
    @Column(name = "TenTopping")
    private String tenTopping;
    @Column(name = "SoLuongDangCo")
    private Integer soLuongDangCo;
    @Column(name = "gia")
    private Float gia;
    @Column(name = "hinh")
    private String hinh;
    @JsonIgnore
    @OneToMany(mappedBy = "topping")
    private List<ChiTietTopping> chiTietToppingList;
}
