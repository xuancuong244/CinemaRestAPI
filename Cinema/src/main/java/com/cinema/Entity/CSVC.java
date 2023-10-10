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
@Table(name = "CSVC")
public class CSVC implements Serializable {
    @Id
    private String maCSVC;
    private String tenCSVC;
    private String hinh;
    @JsonIgnore
    @OneToMany(mappedBy = "csvc")
    private List<ChiTietCSVC> chiTietCSVCList;
}
