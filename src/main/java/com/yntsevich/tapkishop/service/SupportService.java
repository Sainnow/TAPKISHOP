package com.yntsevich.tapkishop.service;



import com.yntsevich.tapkishop.model.Support;
import com.yntsevich.tapkishop.repositories.SupportRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Slf4j
@RequiredArgsConstructor
public class SupportService {
    private final SupportRepository supportRepository;
    public void saveSupport(String name,String phone,String code) {
        Support support = new Support();
        support.setName(name);
        support.setPhone(phone);
        support.setCode(code);
        support.setActive(true);
        supportRepository.save(support);
    }

    public List<Support> list() {
        return supportRepository.findAll();
    }

    public void supportChangeActive(Long id)
    {
        Support support=supportRepository.findById(id).orElse(null);
        support.setActive(false);
        supportRepository.save(support);
    }
}
