package com.cinema.Services.implServices;

import com.cinema.Entity.NgayChieu;
import com.cinema.Reponsitory.NgayChieuReponsitory;
import com.cinema.Services.NgayChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class NgayChieuServiceImpl implements NgayChieuService {
    @Autowired
    NgayChieuReponsitory ngayChieuReponsitory;

    @Override
    public List<NgayChieu> findAll() {
        return ngayChieuReponsitory.findAll();
    }
    @Override
    public List<NgayChieu> findByPhim_MaPhim(String maPhim) {
        return ngayChieuReponsitory.findByPhim_MaPhim(maPhim);
    }
    @Override
    public boolean existsById(Integer stt) {
        return ngayChieuReponsitory.existsById(stt);
    }

    @Override
    public NgayChieu addNgayChieu(NgayChieu ngayChieu) {
        // Tự động tăng
        ngayChieu.setStt(0);
        return ngayChieuReponsitory.save(ngayChieu);
    }

    // Xóa
    @Override
    public void deleteNgayChieu(int stt) {
        ngayChieuReponsitory.deleteById(stt);
    }

    // Cập nhật
    @Override
    public NgayChieu updateNgayChieu(int stt, NgayChieu updatedNgayChieu) {
        NgayChieu existingNgayChieu = ngayChieuReponsitory.findById(stt)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm Ngày chiếu với ID: " + stt));

        // Cập nhật thông tin Khách hàng
        existingNgayChieu.setStt(updatedNgayChieu.getStt());
        existingNgayChieu.setNgay(updatedNgayChieu.getNgay());
        existingNgayChieu.setPhim(updatedNgayChieu.getPhim());
        existingNgayChieu.setGioBatDau(updatedNgayChieu.getGioBatDau());

        // Lưu vào cơ sở dữ liệu
        return ngayChieuReponsitory.save(existingNgayChieu);
    }
}
