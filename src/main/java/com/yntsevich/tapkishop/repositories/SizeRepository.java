package com.yntsevich.tapkishop.repositories;

import com.yntsevich.tapkishop.model.Size;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SizeRepository extends JpaRepository<Size,Long> {

    List<Size> findPropertysizesByClassnameId(Long id);

    Size findByTitle(String title);
}
