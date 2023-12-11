package com.cinema.Services.implServices;

import com.cinema.Entity.Quyen;
import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.QuyenReponsitory;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
import com.cinema.Services.QuyenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuyenServiceImpl implements QuyenService {

    @Autowired
    QuyenReponsitory quyenReponsitory;

    @Autowired
    TaiKhoanReponsitory taiKhoanReponsitory;

    @Override
    public List<Quyen> findAll() {
        return quyenReponsitory.findAll();
    }

    @Override
    public Quyen create(Quyen auth) {
        return quyenReponsitory.save(auth);
    }

    @Override
    public void delete(Integer id) {
        quyenReponsitory.deleteById(id);
    }

    @Override
    public List<Quyen> findAuthoritiesOfAdministrators() {
        List<TaiKhoan> taiKhoans= taiKhoanReponsitory.getAdmin();
        return quyenReponsitory.authoritiesOf(taiKhoans);
    }
}
