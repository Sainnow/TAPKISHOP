package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.Classname;
import com.yntsevich.tapkishop.model.Gender;
import com.yntsevich.tapkishop.repositories.ClassnameRepository;
import com.yntsevich.tapkishop.repositories.GenderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ClassnameService {
    private final ClassnameRepository classnameRepository;
    private final GenderRepository genderRepository;

    public  void saveClassname(Classname classname, Long typeid)
    {
        Gender gender= genderRepository.getById(typeid);
        classname.setGender(gender);

        classnameRepository.save(classname);
    }
    public List<Classname> listClassname(String name) {
        if (name != null) return classnameRepository.findByName(name);
        return classnameRepository.findAll();
    }

    public Classname listClassnameByProduct(Long productId) {
        return classnameRepository.findClassnameByProductsId(productId);
    }


    public List<Classname> list() {
        return  classnameRepository.findAll();
    }
}
