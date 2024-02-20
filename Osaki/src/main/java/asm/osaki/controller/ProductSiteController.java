package asm.osaki.controller;

import asm.osaki.entities.product.Product;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.repositories.product_repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductSiteController {
    @Autowired
    ProductRepository productRepository;

    @GetMapping("/search")
    public String searchProduct(@ModelAttribute("UserC") UserCustom userCustom, @RequestParam(value = "search", required = true) String search, Model model) {
        System.out.println("search: " + search);
        List<Product> productList = productRepository.searchProductByName(search);
        System.out.println("true: " + productList.size());
        return "listProduct";
    }
    @GetMapping("/search-category/{id}")
    public String searchCategory(@ModelAttribute("UserC") UserCustom userCustom, @PathVariable("id") int cateroryID){
        List<Product>  productListCategory= productRepository.findByAllCategory(cateroryID);
        System.out.println("findByAllCategory: ");
        for(Product product: productListCategory){
            System.out.println("productID: "+ product.getProductID());
        }
        return "listProduct";
    }
    @GetMapping("/search-brand/{id}")
    public String searchBrand(@ModelAttribute("UserC") UserCustom userCustom, @PathVariable("id") int brandID){
        List<Product> productListBrand = productRepository.findByAllBrand(brandID);
        System.out.println("findByAllBrand: ");
        for(Product product: productListBrand){
            System.out.println("ProductID: "+ product.getProductID());
        }        return "listProduct";
    }

}
