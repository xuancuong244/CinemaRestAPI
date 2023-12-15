package com.cinema.Services.implServices;

import com.cinema.Entity.OrderTopping;
import com.cinema.Reponsitory.OrderToppingReponsitory;
import com.cinema.Services.OrderToppingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class OrderToppingServiceImpl implements OrderToppingService {
    @Autowired
    OrderToppingReponsitory orderToppingReponsitory;

    @Override
    public List<OrderTopping> findAll() {
        return orderToppingReponsitory.findAll();
    }

    @Override
    public boolean existsById(String tpId) {
        return orderToppingReponsitory.existsById(tpId);
    }

    @Override
    public void deleteTopping(String toppingID) {
        orderToppingReponsitory.deleteById(toppingID);
    }

    @Override
    public OrderTopping updateTopping(String toppingID, OrderTopping updateTopping) {
        OrderTopping existingTopping = orderToppingReponsitory.findById(toppingID)
                .orElseThrow(() -> new EntityNotFoundException("Không thể tìm Topping với ID: " + toppingID));

        // Cập nhật thông tin Khách hàng
        existingTopping.setMaTopping(updateTopping.getMaTopping());
        existingTopping.setTenTopping(updateTopping.getTenTopping());
        existingTopping.setSoLuongDangCo(updateTopping.getSoLuongDangCo());
        existingTopping.setGia(updateTopping.getGia());
        existingTopping.setHinh(updateTopping.getHinh());

        // Lưu vào cơ sở dữ liệu
        return orderToppingReponsitory.save(existingTopping);
    }

    @Override
    public OrderTopping addTopping(OrderTopping topping) {
        topping.setMaTopping("0");
        return orderToppingReponsitory.save(topping);
    }
}
