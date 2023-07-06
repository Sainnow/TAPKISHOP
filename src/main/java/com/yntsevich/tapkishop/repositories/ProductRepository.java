package com.yntsevich.tapkishop.repositories;

import com.yntsevich.tapkishop.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String name);
    List<Product> findProductByClassnameId(Long id);

    List<Product> findProductByGenderId(Long id);


}
