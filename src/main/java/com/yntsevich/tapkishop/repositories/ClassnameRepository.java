package com.yntsevich.tapkishop.repositories;


import com.yntsevich.tapkishop.model.Classname;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClassnameRepository extends JpaRepository<Classname,Long> {
    Classname findClassnameByProductsId(Long id);
    List<Classname> findByName(String name);
}
