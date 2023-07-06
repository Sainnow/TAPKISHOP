package com.yntsevich.tapkishop.repositories;


import com.yntsevich.tapkishop.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order,Long> {

    Order findByCode(String code);

    List<Order> findByUserId(Long id);
}
