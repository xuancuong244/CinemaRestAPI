package com.cinema.Services.implServices;

import com.cinema.Entity.Phim;
import com.cinema.Reponsitory.PhimReponsitory;
import com.cinema.Services.PhimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class PhimServiceImpl implements PhimService {
    @Autowired
    PhimReponsitory phimReponsitory;

    @Override
    public List<Phim> findAll() {
        return phimReponsitory.findAll();
    }

    @Override
    public List<Phim> findPhimByTrangThai(String trangThai) {
        return phimReponsitory.findPhimByTrangThai(trangThai);
    }
    @Override
    public Optional<Phim> findById(String maPhim) {
        return phimReponsitory.findById(maPhim);
    }

    @Override
    public Phim create(Phim phim) {
        return phimReponsitory.save(phim);
    }

    @Override
    public Phim addPhim(Phim phim) {
        return phimReponsitory.save(phim);
    }

    @Override
    public Phim update(String maPhim, Phim updatedPhim) {
        Phim existingPhim = phimReponsitory.findById(maPhim)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm Phim với ID: " + maPhim));

        // Cập nhật thông tin Phim
        existingPhim.setTenPhim(updatedPhim.getTenPhim());
        existingPhim.setDienVien(updatedPhim.getDienVien());
        existingPhim.setNamSX(updatedPhim.getNamSX());
        existingPhim.setDaoDien(updatedPhim.getDaoDien());
        existingPhim.setQuocGia(updatedPhim.getQuocGia());
        existingPhim.setMoTa(updatedPhim.getMoTa());
        existingPhim.setTrailer(updatedPhim.getTrailer());
        existingPhim.setHinh(updatedPhim.getHinh());
        existingPhim.setThoiLuong(updatedPhim.getThoiLuong());

        // Lưu vào cơ sở dữ liệu
        return phimReponsitory.save(existingPhim);
    }
    @Override
    public boolean isMaPhimExisted(String maPhim) {
        return phimReponsitory.existsById(maPhim);
    }

    @Override
    public void delete(String phim) {
        phimReponsitory.deleteById(phim);
    }

    @Override
    public List<Phim> findByKeywords(String keyword) {
        return phimReponsitory.findByKeywords(keyword);
    }
}
