package com.cinema.Services.implServices;

import com.cinema.Entity.XuatChieu;
import com.cinema.Reponsitory.XuatChieuReponsitory;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.Date;
import java.util.List;

@Service
public class XuatChieuServiceImpl implements XuatChieuService {
    @Autowired
    XuatChieuReponsitory xuatChieuReponsitory;

    @Override
    public List<XuatChieu> findAll() {
        return xuatChieuReponsitory.findAll();
    }

    @Override
    public List<XuatChieu> findByMaPhim(String maPhim) {
        return xuatChieuReponsitory.findByMaPhim(maPhim);
    }

    @Override
    public boolean existsById(Integer scId) {
        return xuatChieuReponsitory.existsById(scId);
    }

    @Override
    public void deleteSC(int scId) {
        xuatChieuReponsitory.deleteById(scId);
    }

    @Override
    public XuatChieu updateSC(int scId, XuatChieu updateSC) {
        XuatChieu existingSC = xuatChieuReponsitory.findById(scId)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm suất chiếu với ID: " + scId));
        existingSC.setStt(existingSC.getStt());
        existingSC.setPhim(existingSC.getPhim());
        existingSC.setPhongChieu(existingSC.getPhongChieu());
        existingSC.setNgayChieu(existingSC.getNgayChieu());
        existingSC.setGiaXuatChieu(existingSC.getGiaXuatChieu());
        return xuatChieuReponsitory.save(existingSC);
    }

    @Override
    public XuatChieu addSC(XuatChieu sc) {
        sc.setStt(0);
        return xuatChieuReponsitory.save(sc);
    }
}
