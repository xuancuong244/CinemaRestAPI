package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
