package asm.osaki.controller;

import asm.osaki.entities.user.UserCustom;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller

public class ComponentController {


    @GetMapping("product")
    public String productController() {
        return "product";
    }
    @GetMapping("access-denied")
    public String notFound() {
        return "notFound";
    }

    @GetMapping("contact")
    public String contactController() {
        return "contact";
    }

    @GetMapping("list/product")
    public String listProductController() {
        return "listProduct";
    }

    @GetMapping("news")
    public String newsController() {
        return "news";
    }

    @GetMapping("pays")
    public String payController() {
        return "pay";
    }
}
