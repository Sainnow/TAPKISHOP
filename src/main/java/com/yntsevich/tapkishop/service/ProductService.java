package com.yntsevich.tapkishop.service;

import com.yntsevich.tapkishop.model.*;
import com.yntsevich.tapkishop.repositories.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    private final GenderRepository genderRepository;
    private final ClassnameRepository classnameRepository;
    private final  ValueService valueService;
    private final ImageRepository imageRepository;
    public List<Product> listProducts(String title) {

        if (title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }

    public List<Product> allProducts() {

        return productRepository.findAll();
    }

    public List<Product> ProductsById(Long id) {
        boolean check=false;
        List<Product> products = productRepository.findAll();
        for (Product product : products) {
            if (product.getId().equals(id)) {
                check=true;
            }
        }
        if(check){
        List<Product> productList = new ArrayList<>();
        productList.add(productRepository.getById(id));
        return productList;}
        else{
            return productRepository.findAll();
        }
    }

    public void saveProduct(Principal principal, Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3,
                        Long typeid, Long classid, List<String> value,List<Long> propertyid) throws IOException {
        product.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        Gender gender= genderRepository.getById(typeid);
        product.setGender(gender);
        Classname classname =classnameRepository.getById(classid);
        product.setClassname(classname);

        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId());
        productRepository.save(product);
        int numbner=0 ;
        for (int i = 0; i < value.size(); i++) {
            valueService.saveValue(value.get(i),propertyid.get(i),product.getId());
            numbner= numbner + Integer.parseInt(value.get(i));
        }
        product.setNumber(numbner);
        productRepository.save(product);
        log.info(String.valueOf(product.getId()));
    }

    public void editProduct(Long productid,MultipartFile file1, MultipartFile file2, MultipartFile file3,
                            String title,Integer price,String uppermaterial,String liningmaterial,
                            String solematerial,String heel,String description
    ) throws IOException {
        Product product = productRepository.getById(productid);
        if (title != null) {
            product.setTitle(title);
        }
        if (price != null) {
            product.setPrice(price);
        }
        if (uppermaterial != null) {
            product.setUppermaterial(uppermaterial);
        }
        if (liningmaterial != null) {
            product.setLiningmaterial(liningmaterial);
        }
        if (solematerial != null) {
            product.setSolematerial(solematerial);
        }
        if (heel != null)
        {
            product.setHeel(heel);
        }
        if(description!=null)
        {
            product.setDescription(description);
        }
        Image image1;
        Image image2;
        Image image3;
        List<Image> images=imageRepository.findByProductId(productid);
        if (file1.getSize() != 0) {
            for (Image image : images) {
                if (image.getName().equals("file1")) {

                    image.setProduct(null);
                }
            }
        }
        if (file2.getSize() != 0) {
            for (Image image : images) {
                if (image.getName().equals("file2")) {
                    image.setProduct(null);
                }
            }
        }
        if (file3.getSize() != 0) {
            for (Image image : images) {
                if (image.getName().equals("file3")) {
                    image.setProduct(null);
                }
            }
        }
        for (Image image : images) {
            if (image.getProduct() == null) {
                imageRepository.delete(image);
            }
        }
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }
        log.info("Saving new Product. Title: {}; Author email: {}", product.getTitle(), product.getUser().getEmail());
        Product productFromDb = productRepository.save(product);
        List<Image> imageList=imageRepository.findByProductId(productid);
        for (Image image : imageList) {
            if (image.isPreviewImage()) {
                productFromDb.setPreviewImageId(image.getId());
            }
        }
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }

    public void deleteProduct(Long id) {
        Product product = productRepository.findById(id).orElse(null);
        assert product != null;
        productRepository.delete(product);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public List<Product> listProductsByClassname(Long classnameId) {
        if (classnameId != null) return productRepository.findProductByClassnameId(classnameId);
        return productRepository.findAll();
    }

    public List<Product> listProductsByTypename(Long typenameId) {
        if (typenameId != null) return productRepository.findProductByGenderId(typenameId);
        return productRepository.findAll();
    }

    public  List<List<Product>> ListProductPage()
    {
        List<Product> productList= productRepository.findAll();
        List<List<Product>> productPage = new ArrayList<>();
        int pageSize=12;
        int pagenumber=productList.size();
        if(pagenumber%12!=0)
        {
            pagenumber=pagenumber/12+1;
        }else {
            pagenumber=pagenumber/12;
        }
        int num=productList.size();
        for(int i=0; i < pagenumber;i++) {
            productPage.add(new ArrayList<>());
            log.info(String.valueOf(i));
            for(int a=0; a < pageSize ; a++) {
                if(num>0)
                {
               productPage.get(i).add(productList.get(num-1));
               num--;
                    log.info(String.valueOf(num));
                }
            }
        }
        return productPage;
    }


}
