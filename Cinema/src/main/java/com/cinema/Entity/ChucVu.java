package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "chuc_vu")
public class ChucVu {
    @Id
    @Column(name = "Ma_CV")
    private String maCV;

    @Column(name = "Ten_CV")
    private String tenCV;
}
