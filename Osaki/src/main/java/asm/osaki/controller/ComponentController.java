package asm.osaki.controller;

import asm.osaki.entities.user.UserCustom;
import asm.osaki.repositories.user_repositories.AddressRepository;
import asm.osaki.service.SessionService;
import com.restfb.types.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller

public class ComponentController {

    @Autowired
    SessionService sessionService;
    @Autowired
    AddressRepository addressRepository;
    @GetMapping("/product")
    public String productController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "product";
    }
    @GetMapping("/access-denied")
    public String notFound() {
        return "notFound";
    }

    @GetMapping("/contact")
    public String contactController(@ModelAttribute("UserC") UserCustom userCustom, Model model) {
        UserCustom userCustom1 = sessionService.get("userLogin");
        model.addAttribute("address",addressRepository.findByUser(userCustom1));
        model.addAttribute("userLogin",userCustom1);
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
