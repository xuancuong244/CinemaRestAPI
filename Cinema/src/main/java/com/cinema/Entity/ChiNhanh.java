package com.cinema.Entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;


@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chi_nhanh")
public class ChiNhanh{
    @Id
    @Column(name = "ma_cn")
    private String maCN;

    @Column(name = "ten_cn")
    private String tenCN;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "so_dt")
    private String soDT;
}