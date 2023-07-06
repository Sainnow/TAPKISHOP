package com.yntsevich.tapkishop.controller;


import com.yntsevich.tapkishop.model.Order;
import com.yntsevich.tapkishop.model.User;
import com.yntsevich.tapkishop.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private  final UserService userService;
    private final BasketService basketService;
    private  final SupportService supportService;
    private  final ProductService productService;

    @GetMapping("/order")
    public String order(Principal principal,
                         Model model ){
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("basket", basketService.list());
        model.addAttribute("order", orderService.list());

        return "order";
    }


    @PostMapping("/order/add")
    public String createProduct( @RequestParam("basket") List<Long> basketid, Order order) {
        orderService.saveOrder(order,basketid);
        return "redirect:/";
    }


    @GetMapping("/my/orders")
    public String myorder(Model model, Principal principal) {
        User user= productService.getUserByPrincipal(principal);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("order",orderService.listOrderByUserId(user.getId()));
        return "my-order";
    }

    @GetMapping("/my/order/{id}")
    public String basketOrder(@PathVariable Long id,Model model, Principal principal) {
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("basket",basketService.listBasket(id));
        return "order-basket";
    }

    @GetMapping("/support")
    public String products(Model model, Principal principal) {
        model.addAttribute("support",supportService.list());
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        return "support";
    }
    @PostMapping("/help")
    public String products(@RequestParam("name") String name,@RequestParam("phone") String phone,@RequestParam("code") String code
    ) {
        supportService.saveSupport(name,phone,code);
        return "redirect:/about";
    }

    @PostMapping("/support/{id}")
    public String supportStatus(@PathVariable("id") Long id) {
        supportService.supportChangeActive(id);
        return "redirect:/support";
    }
}
