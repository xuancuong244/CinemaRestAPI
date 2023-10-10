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
@Table(name = "Topping")
public class OrderTopping implements Serializable {
    @Id
    private String maTopping;
    private String tenTopping;
    private Integer soLuongDangCo;
    private Float gia;
    private String hinh;
    @JsonIgnore
    @OneToMany(mappedBy = "topping")
    private List<ChiTietTopping> chiTietToppingList;
}
