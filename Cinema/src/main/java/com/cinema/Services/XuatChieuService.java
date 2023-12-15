package com.cinema.Services;

import com.cinema.Entity.XuatChieu;

import java.util.Date;
import java.util.List;

public interface XuatChieuService {
    List<XuatChieu> findAll();

    List<XuatChieu> findByMaPhim(String maPhim);


    boolean existsById(Integer scId);

    void deleteSC(int scId);

    XuatChieu updateSC(int scId, XuatChieu updateSC);

    XuatChieu addSC(XuatChieu sc);
}
