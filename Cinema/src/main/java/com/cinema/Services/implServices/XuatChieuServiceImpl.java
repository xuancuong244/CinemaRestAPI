package com.cinema.Services.implServices;

import com.cinema.Entity.XuatChieu;
import com.cinema.Reponsitory.XuatChieuReponsitory;
import com.cinema.Services.XuatChieuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


//    @Override
//    public List<XuatChieu> findXuatChieuByNgayChieu(Date ngayChieu) {
//        return xuatChieuReponsitory.findXuatChieuByNgayChieu(ngayChieu);
//    }
}
