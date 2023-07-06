package com.yntsevich.tapkishop.service;



import com.yntsevich.tapkishop.model.Basket;
import com.yntsevich.tapkishop.model.Order;
import com.yntsevich.tapkishop.model.Product;
import com.yntsevich.tapkishop.model.User;
import com.yntsevich.tapkishop.repositories.BasketRepository;
import com.yntsevich.tapkishop.repositories.OrderRepository;
import com.yntsevich.tapkishop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private  final BasketRepository basketRepository;
    private final UserRepository userRepository;


    public void saveOrder(Order order, List<Long> basketid) {

        orderRepository.save(order);
       User user= basketRepository.findById(basketid.get(0)).orElse(null).getUser();

        String data= String.valueOf(user.getName().charAt(0));
        order.setUser(user);
        order.setCode(data+order.getId());
        orderRepository.save(order);
        for (int i = 0; i < basketid.size(); i++) {
            Basket basket=basketRepository.getById(basketid.get(i));
            basket.setStatus(0);
            basket.setOrder(order);
            basketRepository.save(basket);
        }
    }

    public List<Order> list() {
        return orderRepository.findAll();
    }

    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }
    public Order listOrderByCode(String code) {
        return orderRepository.findByCode(code);
    }

    public List<Order> listOrderByUserId(Long id){
        return orderRepository.findByUserId(id);
    }
}
