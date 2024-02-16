package asm.osaki.controller;

import asm.osaki.entities.product.Product;
import asm.osaki.repositories.product_repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Controller

public class ProductDetailController {
    @Autowired
    ProductRepository productRepository;

    @GetMapping("product/{id}")
    public String Product(@PathVariable("id") Integer productId, Model model) {
        Product product = productRepository.findByProductID(productId);
        model.addAttribute("product", product);
        System.out.println("run susscessfully product" + product);
        return "product";
    }
}
