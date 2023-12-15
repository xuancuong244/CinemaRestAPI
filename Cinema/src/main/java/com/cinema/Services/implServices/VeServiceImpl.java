package com.cinema.Services.implServices;

import com.cinema.Entity.Ve;
import com.cinema.Reponsitory.VeReponsitory;
import com.cinema.Services.VeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class VeServiceImpl implements VeService {
    @Autowired
    VeReponsitory veReponsitory;
    @Override
    public List<Ve> findAll() {
        return veReponsitory.findAll();
    }
    @Override
    public boolean existsById(Integer veId) {
        return veReponsitory.existsById(veId);
    }

    @Override
    public void deleteVe(int veId) {
        veReponsitory.deleteById(veId);
    }

    @Override
    public Ve updateVe(int veId, Ve updatedVe) {
        Ve existingVe = veReponsitory.findById(veId)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm vé với ID: " + veId));

        // Cập nhật thông tin Khách hàng
        existingVe.setIdVe(existingVe.getIdVe());
        existingVe.setThueVAT(existingVe.getThueVAT());
        existingVe.setTongGiaVe(existingVe.getTongGiaVe());
        existingVe.setKhachHang(existingVe.getKhachHang());
        existingVe.setXuatChieu(existingVe.getXuatChieu());
        existingVe.setChiTietGhe(existingVe.getChiTietGhe());

        return veReponsitory.save(existingVe);
    }

    @Override
    public Ve addVe(Ve veId) {
        veId.setIdVe(0);
        return veReponsitory.save(veId);
    }
}
