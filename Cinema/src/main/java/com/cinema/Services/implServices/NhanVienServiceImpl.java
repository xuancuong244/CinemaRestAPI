package com.cinema.Services.implServices;

import com.cinema.Entity.NhanVien;
import com.cinema.Reponsitory.NhanVienReponsitory;
import com.cinema.Services.NhanVienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class NhanVienServiceImpl implements NhanVienService {
    @Autowired
    NhanVienReponsitory nhanVienReponsitory;

    @Override
    public List<NhanVien> findAll() {
        return nhanVienReponsitory.findAll();
    }

    @Override
    public NhanVien findByEmailAndMatKhau(String email, String matKhau) {
        return nhanVienReponsitory.findByEmailAndMatKhau(email,matKhau);
    }

    @Override
    public NhanVien findByEmail(String email) {
        return nhanVienReponsitory.findByEmail(email);
    }

    @Override
    public NhanVien save(NhanVien nhanVien) {
        return nhanVienReponsitory.save(nhanVien);
    }

    @Override
    public boolean existsById(String emplId) {
        return nhanVienReponsitory.existsById(emplId);
    }

    @Override
    public void deleteEmployee(String emplId) {
        nhanVienReponsitory.deleteById(emplId);
    }

    @Override
    public NhanVien updateEmployee(String emplId, NhanVien updatedEmployee) {
        NhanVien existingEmployee = nhanVienReponsitory.findById(emplId)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm nhân viên với ID: " + emplId));

        // Cập nhật thông tin Khách hàng
        existingEmployee.setMaNV(existingEmployee.getMaNV());
        existingEmployee.setHoTen(existingEmployee.getHoTen());
        existingEmployee.setEmail(existingEmployee.getEmail());
        existingEmployee.setMatKhau(existingEmployee.getMatKhau());
        existingEmployee.setNgaySinh(existingEmployee.getNgaySinh());
        existingEmployee.setSoDT(existingEmployee.getSoDT());
        existingEmployee.setGioiTinh(existingEmployee.getGioiTinh());
        existingEmployee.setChucVu(existingEmployee.getChucVu());

        return nhanVienReponsitory.save(existingEmployee);
    }

    @Override
    public NhanVien addEmployee(NhanVien employee) {
        employee.setMaNV("");
        return nhanVienReponsitory.save(employee);
    }

}
