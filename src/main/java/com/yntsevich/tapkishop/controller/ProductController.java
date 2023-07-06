package com.yntsevich.tapkishop.controller;

import com.yntsevich.tapkishop.model.*;
import com.yntsevich.tapkishop.repositories.ProductRepository;
import com.yntsevich.tapkishop.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {
    private final ProductService productService;
    private final ProductRepository productRepository;
    private final GenderService genderService;
    private final ClassnameService classnameService;
    private final SizeService sizeService;
    private final  ValueService valueService;
    private final  BasketService basketService;

    @GetMapping("/")
    public String products(@RequestParam(name = "searchWord", required = false) String title,
                           @RequestParam(name = "searchClassId", required = false) Long classnameId,
                           @RequestParam(name = "searchTypenameId", required = false) Long typenameId,
                           Principal principal, Model model) {
        if(title!=null) {
            model.addAttribute("products", productService.listProducts(title));
        }else { if(classnameId!=null) {
            model.addAttribute("products", productService.listProductsByClassname(classnameId));
        }else {
            if (typenameId != null) {
                model.addAttribute("products", productService.listProductsByTypename(typenameId));
            }

        }
        }
        model.addAttribute("products", productService.allProducts());
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("searchWord", title);
        model.addAttribute("gender", genderService.list());
        model.addAttribute("classname", classnameService.list());
        return "products";
    }

    @GetMapping("/{id}")
    public String productsPage(@PathVariable Integer id,
                               Principal principal, Model model) {
        List<List<Product>> productList = productService.ListProductPage();
        model.addAttribute("products", productList.get(id));
        model.addAttribute("pagesize", productList.size());
        model.addAttribute("currentpage", id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("gender", genderService.list());
        model.addAttribute("classname", classnameService.list());
        return "products-page";
    }




    @GetMapping("/product/edit/{id}")
    public String productIEdit(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        return "product-edit";
    }

    @GetMapping("/product/{id}")
    public String productInfo(@PathVariable Long id, Model model, Principal principal) {
        Product product = productService.getProductById(id);
        List<Value> value=valueService.listByProduct(id);
        model.addAttribute("user", productService.getUserByPrincipal(principal));
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        model.addAttribute("authorProduct", product.getUser());
        model.addAttribute("value", value);
        return "product-info";
    }

    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3, @RequestParam("typename") Long typename,
                                @RequestParam("classname") Long classname,  @RequestParam("value") List<String> value,
                                @RequestParam("property") List<Long> propertyid,
                                Product product, Principal principal) throws IOException {
        productService.saveProduct(principal, product, file1, file2, file3,typename,classname,value,propertyid);
        return "redirect:/my/products";
    }

    @PostMapping("/product/edit/{id}")
    public String editProduct(@PathVariable Long id,@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2,
                              @RequestParam("file3") MultipartFile file3, @RequestParam String title,
                              @RequestParam Integer price,@RequestParam String uppermaterial,
                              @RequestParam String liningmaterial,@RequestParam String solematerial,
                              @RequestParam String heel, @RequestParam String description) throws IOException {
        productService.editProduct(id,file1,file2,file3,title,price,uppermaterial,liningmaterial,solematerial,heel,description);
        return "redirect:/my/products";
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "redirect:/my/products";
    }


    @GetMapping("/my/products")
    public String userProducts(@RequestParam(name = "searchWord", required = false) Long id,
                               Principal principal, Model model) {
        User user = productService.getUserByPrincipal(principal);
        if(id!=null && id>0) {
            model.addAttribute("products", productService.ProductsById(id));
        }else {        model.addAttribute("products", user.getProducts());}
        model.addAttribute("user", user);
        model.addAttribute("searchWord", id);
        model.addAttribute("gender", genderService.list());
        model.addAttribute("classname", classnameService.list());
        model.addAttribute("property", sizeService.list());
        return "shop-products";
    }

    @PostMapping("/product/basket/{id}")
    public String addBasketProduct(@PathVariable Long id,Principal principal, @RequestParam("size") String size) {
        User user = productService.getUserByPrincipal(principal);
        basketService.saveProductinBasket(id,user.getId(),size);
        return "redirect:/product/{id}";
    }


    @PostMapping("/gender")
    public String creatGender(Gender gender) {
        genderService.saveGender(gender);
        return "redirect:/my/products";
    }

    @PostMapping("/classname")
    public String creatClassname(Classname classname,@RequestParam("gender") Long gender) {
        classnameService.saveClassname(classname,gender);
        return "redirect:/my/products";
    }

    @PostMapping("/size")
    public String creatSize(Size size, @RequestParam("classname") Long classname) {
       sizeService.savePropertysize(size,classname);
        return "redirect:/my/products";
    }
}