package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.*;
import com.yntsevich.tapkishop.repositories.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;


@Service
@Slf4j
@RequiredArgsConstructor
public class BasketService {
    private final ProductRepository productRepository;
    private final BasketRepository basketRepository;
    private final UserRepository userRepository;
    private  final ValueRepository valueRepository;
    private  final SizeRepository sizeRepository;

    public void saveProductinBasket(Long productid, Long userid , String size) {
        Basket basket = new Basket();
        Size sizes= sizeRepository.findByTitle(size);
        Value value=valueRepository.findByProductIdAndSizeId(productid,sizes.getId());
        value.setValue(String.valueOf(Integer.parseInt(value.getValue())-1));
        Product product = productRepository.getById(productid);
        basket.setProduct(product);
        product.setNumber(product.getNumber() - 1);
        productRepository.save(product);
        User user = userRepository.getById(userid);
        basket.setUser(user);
        basket.setStatus(1);
        basket.setSize(size);
        basketRepository.save(basket);
    }

    public List<Basket> list() {
        return basketRepository.findAll();
    }

    public List<Basket> listBasket(Long id) {
        return basketRepository.findBasketByOrderId(id);
    }

    public void deleteBasketProduct(Long id) {
        Basket basket = basketRepository.findById(id).orElse(null);
        Product product= Objects.requireNonNull(basket).getProduct();
        product.setNumber(product.getNumber()+1);
        Size sizes= sizeRepository.findByTitle(basket.getSize());
        Value value=valueRepository.findByProductIdAndSizeId(product.getId(),sizes.getId());
        value.setValue(String.valueOf(Integer.parseInt(value.getValue())+1));
        productRepository.save(product);
        basketRepository.delete(basket);
    }

    public void deleteBasket(Long id) {
        List<Basket> baskets= basketRepository.findBasketByProductId(id);
        basketRepository.deleteAll(baskets);
    }
}
