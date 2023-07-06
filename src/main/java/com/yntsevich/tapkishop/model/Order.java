package com.yntsevich.tapkishop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String payment;

    private Integer card_number;

    private Integer cvc;

    private String owner;

    private String delivery;

    private String area;

    private String city;

    private String address;

    private Integer postal_code;

    private Integer price;

    private String code;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,
            mappedBy = "order")
    private List<Basket> baskets = new ArrayList<>();

}
