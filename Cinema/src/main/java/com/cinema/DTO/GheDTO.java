package com.cinema.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GheDTO {
    private String maGhe;
    private String tenGhe;
    private LoaiGheDTO loaiGhe;
}
