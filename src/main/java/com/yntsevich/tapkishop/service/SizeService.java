package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.Classname;
import com.yntsevich.tapkishop.model.Size;
import com.yntsevich.tapkishop.repositories.ClassnameRepository;
import com.yntsevich.tapkishop.repositories.SizeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class SizeService {

    private final SizeRepository sizeRepository;
    private final ClassnameRepository classnameRepository;
    public  void savePropertysize(Size size, Long classid)
    {
        Classname classname = classnameRepository.getById(classid);
        size.setClassname(classname);


        sizeRepository.save(size);
    }

    public List<Size> list() {
        return sizeRepository.findAll();
    }

    public List<Size> listByClassname(Long id) {

        return sizeRepository.findPropertysizesByClassnameId(id);
    }
}
