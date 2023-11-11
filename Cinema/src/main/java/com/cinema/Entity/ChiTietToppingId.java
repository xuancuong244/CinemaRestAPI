package com.cinema.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ChiTietToppingId implements Serializable {
    @Column(name = "Id_Ve")
    private Integer id;

    @Column(name = "Ma_Topping")
    private String maTopping;
}
