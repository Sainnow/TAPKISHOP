package com.yntsevich.tapkishop.repositories;


import com.yntsevich.tapkishop.model.Value;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ValueRepository extends JpaRepository<Value,Long> {

    List<Value> getValuesBySizeId(Long id);

    List<Value> findByProductId(Long id);
    Value  findByProductIdAndSizeId(Long productId, Long propertyId);
}
