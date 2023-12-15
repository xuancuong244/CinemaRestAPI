package com.cinema.Services;

import com.cinema.Entity.OrderTopping;

import java.util.List;

public interface OrderToppingService {
    List<OrderTopping> findAll();
    boolean existsById(String tpId);

    void deleteTopping(String toppingID);

    OrderTopping updateTopping(String toppingID, OrderTopping updateTopping);

    OrderTopping addTopping(OrderTopping topping);
}
