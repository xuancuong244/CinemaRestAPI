package com.cinema.Services;


import com.cinema.Entity.NgayChieu;

import java.util.List;

public interface NgayChieuService {
    List<NgayChieu> findAll();
    List<NgayChieu> findByPhim_MaPhim(String maPhim);

    // Thêm
    boolean existsById(Integer stt);
    NgayChieu addNgayChieu(NgayChieu ngayChieu);

    // Xóa
    void deleteNgayChieu(int stt);

    // Cập nhật
    NgayChieu updateNgayChieu(int stt, NgayChieu updatedNgayChieu);
}
