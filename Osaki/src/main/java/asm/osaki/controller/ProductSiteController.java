package asm.osaki.controller;

import asm.osaki.entities.product.Product;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.repositories.product_repositories.ProductRepository;
import asm.osaki.service.ParamService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductSiteController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ParamService paramService;
    @Autowired
    HttpServletRequest request;

    @GetMapping("/search")
    public String searchProduct(@ModelAttribute("UserC") UserCustom userCustom, @RequestParam(value = "search", required = true) String search, Model model) {
        System.out.println("search: " + search);
        List<Product> productList = productRepository.searchProductByName(search);
        System.out.println("true: " + productList.size());
        return "listProduct";
    }

    @GetMapping("/search-category/{id}")
    public String searchCategory(@ModelAttribute("UserC") UserCustom userCustom, @PathVariable("id") int cateroryID) {
        List<Product> productListCategory = productRepository.findByAllCategory(cateroryID);
        System.out.println("findByAllCategory: ");
        for (Product product : productListCategory) {
            System.out.println("productID: " + product.getProductID());
        }
        return "listProduct";
    }

    @GetMapping("/search-brand/{id}")
    public String searchBrand(@ModelAttribute("UserC") UserCustom userCustom, @PathVariable("id") int brandID) {
        List<Product> productListBrand = productRepository.findByAllBrand(brandID);
        System.out.println("findByAllBrand: ");
        for (Product product : productListBrand) {
            System.out.println("ProductID: " + product.getProductID());
        }
        return "listProduct";
    }

    @GetMapping("/search-all-category")
    public ResponseEntity<?> searchAllCategory( ) {
        String categoryID = paramService.getString("categoryIDs","");
        List<String> categoryIdList = Arrays.asList(categoryID.split(","));
        List<Product> allProducts = new ArrayList<>(); // Danh sách tổng các sản phẩm thuộc các category

        for (String categoryId : categoryIdList) {
            List<Product> productListCategory = productRepository.findByAllCategory(Integer.parseInt(categoryId));
            allProducts.addAll(productListCategory); // Thêm tất cả sản phẩm từ category này vào danh sách tổng
            System.out.println("cate: " + categoryId);
            // Có thể xử lý từng sản phẩm ở đây nếu cần
        }

        System.out.println("Tổng số sản phẩm: " + allProducts);
        return ResponseEntity.ok(allProducts);
    }
}
