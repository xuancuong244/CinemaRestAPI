package com.cinema.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class LoaiGheDTO {
    private Integer maLoai;
    private String tenLoai;
    private Float phuThu;
}
