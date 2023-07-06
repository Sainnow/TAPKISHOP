package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.Gender;
import com.yntsevich.tapkishop.repositories.GenderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class GenderService {

    private final GenderRepository genderRepository;

    public  void saveGender(Gender gender)
    {
        genderRepository.save(gender);
    }

    public List<Gender> listGender(String name) {
        if (name != null) return genderRepository.findByName(name);
        return genderRepository.findAll();
    }

    public List<Gender> list() {
        return genderRepository.findAll();
    }
}
