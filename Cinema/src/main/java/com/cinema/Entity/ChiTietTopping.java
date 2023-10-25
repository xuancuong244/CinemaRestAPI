package com.cinema.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CHITIETTOPPING")
public class ChiTietTopping {
	@Id
    @Column(name = "idVe")
    private Integer idVe;

    @Id
    @Column(name = "MATOPPING")
    private String maTopping;

    @Column(name = "SOLUONGMUA")
    private Integer soLuongMua;

    @ManyToOne
    @JoinColumn(name = "toppingId")
    private OrderTopping topping;

    @ManyToOne
    @JoinColumn(name = "IdVe")
    private Ve ve;
}
