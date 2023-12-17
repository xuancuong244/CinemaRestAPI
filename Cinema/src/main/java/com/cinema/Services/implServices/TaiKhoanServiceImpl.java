package com.cinema.Services.implServices;

import com.cinema.Entity.ChucVu;
import com.cinema.Entity.Quyen;
import com.cinema.Entity.TaiKhoan;
import com.cinema.Reponsitory.QuyenReponsitory;
import com.cinema.Reponsitory.TaiKhoanReponsitory;
import com.cinema.Services.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class TaiKhoanServiceImpl implements TaiKhoanService {

    @Autowired
    TaiKhoanReponsitory taiKhoanReponsitory;
    @Autowired
    QuyenReponsitory quyenReponsitory;
    @Override
    public List<TaiKhoan> findAll() {
        return taiKhoanReponsitory.findAll();
    }

    @Override
    public TaiKhoan findById(String username) {
        return taiKhoanReponsitory.findById(username).get();
    }

    @Override
    public List<TaiKhoan> getAdmin() {
        return taiKhoanReponsitory.getAdmin();
    }

    @Override
    public void save(TaiKhoan taiKhoan) {
        taiKhoanReponsitory.save(taiKhoan);
    }

    @Override
    public Optional<TaiKhoan> findTaiKhoanByHoTen(String name) {
        return taiKhoanReponsitory.findTaiKhoanByHoTen(name);
    }
    @Override
    public boolean existsById(String username) {
        return taiKhoanReponsitory.existsById(username);
    }

    @Override
    public void deleteTaiKhoan(String username) {
        Optional<TaiKhoan> optionalTaiKhoan = taiKhoanReponsitory.findById(username);
        optionalTaiKhoan.ifPresent(taiKhoan -> taiKhoanReponsitory.delete(taiKhoan));
    }


    @Override
    public TaiKhoan updateTaiKhoan(String username, TaiKhoan updatedTaiKhoan) {
        TaiKhoan existingTaiKhoan = taiKhoanReponsitory.findById(username)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm username với ID: " + username));
        existingTaiKhoan.setUsername(updatedTaiKhoan.getUsername());
        existingTaiKhoan.setMatKhau(updatedTaiKhoan.getMatKhau());
        existingTaiKhoan.setHoTen(updatedTaiKhoan.getHoTen());
        existingTaiKhoan.setGioiTinh(updatedTaiKhoan.getGioiTinh());
        existingTaiKhoan.setDiaChi(updatedTaiKhoan.getDiaChi());
        existingTaiKhoan.setSoDT(updatedTaiKhoan.getSoDT());
        return taiKhoanReponsitory.save(existingTaiKhoan);
    }

    @Override
    public TaiKhoan addTaiKhoan(TaiKhoan username) {
        TaiKhoan newTK = taiKhoanReponsitory.save(username);

        ChucVu cv = new ChucVu();
        cv.setMaCV("CUST");

        Quyen q = new Quyen();
        q.setTaiKhoan(newTK);
        q.setChucVu(cv);

        quyenReponsitory.save(q);



        return newTK;
    }
}
