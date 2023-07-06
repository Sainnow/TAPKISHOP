package com.yntsevich.tapkishop.controller;


import com.yntsevich.tapkishop.model.User;
import com.yntsevich.tapkishop.service.BasketService;
import com.yntsevich.tapkishop.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class BasketController {
    private final UserService userService;
    private final BasketService basketService;

    @GetMapping("/basket")
    public String basket(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("basket", basketService.list());

        return "basket";
    }

    @PostMapping("/basket/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        basketService.deleteBasketProduct(id);
        return "redirect:/basket";
    }
}
