package com.cinema.Entity;


import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;


@Entity
@Data
public class MovieStatistics {
    @Id
    private Long id; // Bạn có thể sử dụng ID hoặc không, phụ thuộc vào cấu trúc của bạn
    private String ten_kh;
    private String sodt;
    private String ten_phim;
    private String cac_ghe_da_mua;
    private Float tong_tien;
}
