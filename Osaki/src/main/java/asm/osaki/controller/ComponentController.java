package asm.osaki.controller;

import asm.osaki.entities.user.UserCustom;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller

public class ComponentController {


    @GetMapping("/product")
    public String productController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "product";
    }
    @GetMapping("/access-denied")
    public String notFound() {
        return "notFound";
    }

    @GetMapping("/contact")
    public String contactController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "contact";
    }

    @GetMapping("list/product")
    public String listProductController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "listProduct";
    }

    @GetMapping("/news")
    public String newsController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "news";
    }

    @GetMapping("pays")
    public String payController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "pay";
    }
}
