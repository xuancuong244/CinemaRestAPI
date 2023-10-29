package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "CSVC")
public class CSVC {
	@Id
    @Column(name = "Ma_CSVC")
    private String maCSVC;
    @Column(name = "Ten_CSVC")
    private String tenCSVC;
    @Column(name = "Hinh")
    private String hinh;
}
