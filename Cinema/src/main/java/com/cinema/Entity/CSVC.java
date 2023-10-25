package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CSVC")
public class CSVC {
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
