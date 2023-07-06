package com.yntsevich.tapkishop.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "property")
@Data
public class Size {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    private Classname classname;



}
