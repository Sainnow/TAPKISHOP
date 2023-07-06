package com.yntsevich.tapkishop.repositories;

import com.yntsevich.tapkishop.model.Gender;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface GenderRepository extends JpaRepository<Gender,Long> {
    List<Gender> findByName(String name);
}
