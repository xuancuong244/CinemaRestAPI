package com.cinema.Reponsitory;

import com.cinema.Entity.OrderTopping;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderToppingReponsitory extends JpaRepository<OrderTopping, String> {
}
