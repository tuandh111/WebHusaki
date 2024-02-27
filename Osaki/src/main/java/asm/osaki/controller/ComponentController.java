package asm.osaki.controller;


import asm.osaki.entities.product.PromotionalDetails;
import asm.osaki.entities.user.Address;
import asm.osaki.entities.user.Invoice;
import asm.osaki.entities.user.InvoiceDetail;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.entities.user.WishList;
import asm.osaki.repositories.product_repositories.PromotionalDetailsRepository;
import asm.osaki.repositories.user_repositories.AddressRepository;
import asm.osaki.repositories.user_repositories.InvoiceDetailRepository;
import asm.osaki.repositories.user_repositories.InvoiceRepository;
import asm.osaki.repositories.user_repositories.UserCustomRepository;
import asm.osaki.repositories.user_repositories.WishListRepository;
import asm.osaki.service.ParamService;
import asm.osaki.service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
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
    @Autowired
    ParamService paramService;
    @Autowired
    UserCustomRepository userCustomRepository;

    @Autowired
    PromotionalDetailsRepository promotionalDetailsRepository;


    @GetMapping("/product")
    public String productController(@ModelAttribute("UserC") UserCustom userCustom) {
        return "product";
    }

    @GetMapping("/access-denied")
    public String notFound() {
        return "notFound";
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
                List<PromotionalDetails> promotionalDetailsList1 = promotionalDetailsRepository.findAll();
                model.addAttribute("promotionalDetailsList", promotionalDetailsList1);
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
            if (content.equalsIgnoreCase("_cartCancel.jsp")) {
                UserCustom userCustom = sessionService.get("userLogin");
                if (userCustom != null) {
                    List<Invoice> invoiceList = invoiceRepository.findByUserID(userCustom.getUserID());
                    System.out.println("invoiceList: " + invoiceList.size());
                    List<InvoiceDetail> invoiceDetailList = invoiceDetailRepository.findAll();
                    model.addAttribute("invoiceDetailList", invoiceDetailList);
                    model.addAttribute("invoiceList", invoiceList);
                }
            }
            if (content.equalsIgnoreCase("_successcart.jsp")) {
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
        return "profile";
    }


    @PostMapping("edit-info-account")
    public String editInfoAccount(Model model, @RequestParam("idInput") Integer idInput, @RequestParam("file") MultipartFile fileInput, @RequestParam("fullName") String nameInput, HttpSession session) {
        System.out.println("idInputxxxxx" + idInput);
        UserCustom userCustom = userCustomRepository.findByUserID(idInput);
        //model.addAttribute("address", addressRepository.findByUser(userCustom));
        String nameAnh = userCustom.getImage();
        if (!fileInput.isEmpty()) {
            String originalFilename = fileInput.getOriginalFilename();
            // String savePath = "/images/" + originalFilename;
            File NameFile = paramService.save(fileInput, "/images/");
            if (NameFile != null) {
                String imageName = NameFile.getName();
                userCustom.setImage(imageName);
            }
            //	String iamgeA = fileInput.getOriginalFilename();
        }

        userCustom.setFullName(nameInput);

        userCustomRepository.save(userCustom);

        session.setAttribute("userLogin", userCustom);

//       	 UserCustom userCustom = sessionService.get("userLogin");
//       	 if(userCustom!=null) {
//       		 model.addAttribute("idInput",userCustom.getUserID());
//       		 model.addAttribute("email",userCustom.getEmail());
//       		 model.addAttribute("fullName",userCustom.getFullName());
//       		 System.out.println("Userxxxxx:"+userCustom.getUserID());
//       	 }

        return "redirect:/profile";
    }


    @DeleteMapping("delete-to-likeProduct")
    public ResponseEntity<?> deleteLikeProduct() {
        String likeProductId = paramService.getString("likeID", "");
        WishList wishList = wishListRepository.getById(Integer.parseInt(likeProductId));
        try {
            wishListRepository.delete(wishList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok("fail");
        }
        return ResponseEntity.ok("success");
    }

    @PostMapping("update-cart-product")
    public ResponseEntity<?> updateCartProduct() {
        UserCustom userCustom = sessionService.get("userLogin");
        String invoieID = paramService.getString("invoiceID", "");

        try {
            Invoice invoice = invoiceRepository.findByInvoiceID(invoieID);
            invoice.setStatus("Đã hủy đơn hàng");
            invoiceRepository.save(invoice);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok("fail");
        }
        return ResponseEntity.ok("success");
    }

    @PostMapping("update-cart-product-restore")
    public ResponseEntity<?> updateCartProductRestore() {
        UserCustom userCustom = sessionService.get("userLogin");
        String invoieID = paramService.getString("invoiceID", "");
        String invoieDetailID = paramService.getString("invoiceDetailID", "");

        try {
            Invoice invoice = invoiceRepository.findByInvoiceID(invoieID);
            invoice.setStatus("Đặt hàng");
            invoiceRepository.save(invoice);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.ok("fail");
        }
        return ResponseEntity.ok("success");
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
