package com.cinema.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Entity(name = "CHUCVU")
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "CHUCVU")
public class ChucVu {
	@Id
    private String maCV;
    private String tenCV;
    @JsonIgnore
    @OneToMany(mappedBy = "chucVu")
    List<NhanVien> nhanVienList;
}
