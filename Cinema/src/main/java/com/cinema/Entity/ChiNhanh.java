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
@Table(name = "ChiNhanh")
public class ChiNhanh implements Serializable {
    @Id
    private String maCN;
    private String tenCN;
    private String diaChi;
    private String soDT;
    @JsonIgnore
    @OneToMany(mappedBy = "chiNhanh")
    List<LichLamViec> lichLamViecList;
    @JsonIgnore
    @OneToMany(mappedBy = "nhanh")
    List<PhongChieu> phongChieuList;
}
