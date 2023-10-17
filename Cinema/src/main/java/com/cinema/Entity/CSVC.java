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
@Table(name = "CSVC")
public class CSVC implements Serializable {
    @Id
    @Column(name = "maCSVC")
    private String maCSVC;
    @Column(name = "tenCSVC")
    private String tenCSVC;
    @Column(name = "hinh")
    private String hinh;

    @JsonIgnore
    @OneToMany(mappedBy = "csvc")
    private List<ChiTietCSVC> chiTietCSVCList;
}
