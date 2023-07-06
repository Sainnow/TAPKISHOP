package com.yntsevich.tapkishop.repositories;


import com.yntsevich.tapkishop.model.Basket;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BasketRepository extends JpaRepository<Basket,Long> {

    List<Basket> findBasketByOrderId(Long id);
    List<Basket> findBasketByProductId(Long id);
}
