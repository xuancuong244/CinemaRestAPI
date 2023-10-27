package com.cinema.Entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;


@SuppressWarnings("serial")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chi_nhanh")
public class ChiNhanh{
    @Id
    @Column(name = "MaCN")
    private String maCN;

    @Column(name = "TenCN")
    private String tenCN;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "SoDT")
    private String soDT;
}
