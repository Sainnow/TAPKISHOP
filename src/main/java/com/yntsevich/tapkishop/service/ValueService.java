package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.Product;
import com.yntsevich.tapkishop.model.Size;
import com.yntsevich.tapkishop.model.Value;
import com.yntsevich.tapkishop.repositories.ProductRepository;
import com.yntsevich.tapkishop.repositories.SizeRepository;
import com.yntsevich.tapkishop.repositories.ValueRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ValueService {
    private final ValueRepository valueRepository;
    private final SizeRepository sizeRepository;
    private final ProductRepository productRepository;

    public  void saveValue(String values,Long propertyid,Long productid)
    {
        Value value = new Value();
        value.setValue(values);
        Size size = sizeRepository.getById(propertyid);
        value.setSize(size);
        Product product = productRepository.getById(productid);
        value.setProduct(product);
        valueRepository.save(value);

    }

    public List<Value> list() {
        return valueRepository.findAll();
    }

    public List<Value> listByProduct(Long id) {

        return valueRepository.findByProductId(id);
    }



    public Value listByProductAndProperty(Long productId, Long propertyId) {

        return valueRepository.findByProductIdAndSizeId(productId,propertyId);
    }


}
