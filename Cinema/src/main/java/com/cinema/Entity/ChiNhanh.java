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


@SuppressWarnings("serial")
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chi_nhanh")
public class ChiNhanh{
    @Id
    @Column(name = "Ma_CN")
    private String maCN;

    @Column(name = "Ten_CN")
    private String tenCN;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "So_DT")
    private String soDT;
}
