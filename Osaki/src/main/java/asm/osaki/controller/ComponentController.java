package asm.osaki.controller;

import asm.osaki.entities.user.Invoice;
import asm.osaki.entities.user.InvoiceDetail;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.entities.user.WishList;
import asm.osaki.repositories.user_repositories.AddressRepository;
import asm.osaki.repositories.user_repositories.InvoiceDetailRepository;
import asm.osaki.repositories.user_repositories.InvoiceRepository;
import asm.osaki.repositories.user_repositories.WishListRepository;
import asm.osaki.service.SessionService;
import com.restfb.types.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller

public class ComponentController {

    @Autowired
    SessionService sessionService;
    @Autowired
    AddressRepository addressRepository;
    @Autowired
    WishListRepository wishListRepository;
    @Autowired
    InvoiceRepository invoiceRepository;
    @Autowired
    InvoiceDetailRepository invoiceDetailRepository;
    @GetMapping("/product")
    public String productController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "product";
    }

    @GetMapping("/access-denied")
    public String notFound() {
        return "notFound";
    }


    @GetMapping("/news")
    public String newsController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "news";
    }

    @GetMapping("pays")
    public String payController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "pay";
    }

    public String profileController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "profile";
    }

    @GetMapping("profile")
    public String getHome(@RequestParam(name = "content", required = false) String content, Model model) {
        if (content != null && !content.isEmpty()) {
            content += ".jsp";
            model.addAttribute("content", content);
            if (content.equalsIgnoreCase("_likeProduct.jsp")) {
                UserCustom userCustom = sessionService.get("userLogin");
                if (userCustom != null) {
                    List<WishList> listLike = wishListRepository.findByUser(userCustom);
                    System.out.println("likeList: " + listLike.size());
                    model.addAttribute("listLike", listLike);
                }
            }
            if (content.equalsIgnoreCase("_cart.jsp")) {
                UserCustom userCustom = sessionService.get("userLogin");
                if (userCustom != null) {
                    List<Invoice> invoiceList = invoiceRepository.findByUserID(userCustom.getUserID());
                    System.out.println("invoiceList: " + invoiceList.size());
                    List<InvoiceDetail> invoiceDetailList = invoiceDetailRepository.findAll();
                    model.addAttribute("invoiceDetailList", invoiceDetailList);
                    model.addAttribute("invoiceList", invoiceList);
                }
            }
            System.out.println("content is: " + content);
        } else {
            model.addAttribute("content", "_dashboard3.jsp");
        }
        UserCustom userCustom1 = sessionService.get("userLogin");
        model.addAttribute("address", addressRepository.findByUser(userCustom1));
        model.addAttribute("userLogin", userCustom1);
        return "/profile";
    }

    @ModelAttribute("likeList")
    public List<WishList> getCategories(HttpSession session) {
        UserCustom userCustom = (UserCustom) session.getAttribute("userLogin");

        System.out.println("userCustom1: " + userCustom);
        if (userCustom != null) {
            List<WishList> listLike = wishListRepository.findByUser(userCustom);
            return listLike;
        }
        return null;
    }
}
