package asm.osaki.controller;

import asm.osaki.entities.product.Product;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.repositories.product_repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
