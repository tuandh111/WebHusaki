package asm.osaki.controller;

import asm.osaki.entities.product.Cart;
import asm.osaki.entities.product.Product;
import asm.osaki.entities.product.PromotionalDetails;
import asm.osaki.entities.user.Address;
import asm.osaki.entities.user.Comment;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.entities.user.Voucher;
import asm.osaki.repositories.product_repositories.CartRepository;
import asm.osaki.repositories.product_repositories.ProductRepository;
import asm.osaki.repositories.product_repositories.PromotionalDetailsRepository;
import asm.osaki.repositories.user_repositories.AddressRepository;
import asm.osaki.repositories.user_repositories.CommentRepository;
import asm.osaki.repositories.user_repositories.InvoiceDetailRepository;
import asm.osaki.repositories.user_repositories.VoucherRepository;
import asm.osaki.service.ParamService;
import asm.osaki.service.SessionService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller

public class ProductDetailController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CommentRepository commentRepository;
    @Autowired
    ParamService paramService;

    @Autowired
    CartRepository cartRepository;
    @Autowired
    SessionService sessionService;

    @Autowired
    PromotionalDetailsRepository promotionalDetailsRepository;

    @Autowired
    AddressRepository addressRepository;
    @Autowired
    VoucherRepository voucherRepository;
    @Autowired
    InvoiceDetailRepository invoiceDetailRepository;
    @GetMapping("product/{id}")
    public String Product(@ModelAttribute("UserC") UserCustom userCustom1, @PathVariable("id") Integer productId, Model model) {
        Product product = productRepository.findByProductID(productId);
        UserCustom userCustom = sessionService.get("userLogin");
        if (userCustom != null) {
            List<Voucher> voucherList = voucherRepository.findByAllUserID(userCustom.getUserID());
            List<Cart> cartList = cartRepository.findAllByUser(userCustom);
            double totalPrice = sessionService.totalPriceCartByUserId(userCustom);
            List<Address> addressList = addressRepository.findByUser(userCustom);

            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("cartList", cartList);
            model.addAttribute("addressList", addressList);
            model.addAttribute("voucherList", voucherList);
        }
        List<PromotionalDetails> promotionalDetailsList = promotionalDetailsRepository.findAll();
        List<Integer> integerList = invoiceDetailRepository.countSoldProductsByProductID(product.getProductID());
        int price=0;
        for (Integer integer: integerList){
            price+=integer;
        }
        model.addAttribute("count",price);
        model.addAttribute("promotionalDetailsList1", promotionalDetailsList);
        model.addAttribute("product", product);
        model.addAttribute("comment", commentRepository.findByProductID(product, Sort.by(Sort.Direction.ASC, "createAt")));
        System.out.println("run successfully product" + product);
        return "product";
    }

    @PostMapping("add_comment")
    public ResponseEntity<?> addComment() {
        UserCustom userCustom = sessionService.get("userLogin");
        String productID = paramService.getString("productID", "");
        String star = paramService.getString("star", "");
        String content = paramService.getString("content", "");
        System.out.println("productID: " + productID + " star: " + star + " content: " + content);
        Comment comment = new Comment();
        comment.setContent(content);
        comment.setStar(Integer.parseInt(star));
        comment.setUser(userCustom);
        comment.setIsDelete(false);
        comment.setProductID(productRepository.findByProductID(Integer.parseInt(productID)));
        comment.setImages(null);
        Map<String, Object> json = new HashMap<>();
        try {
            commentRepository.save(comment);
        } catch (Exception e) {
            e.printStackTrace();
            json.put("message", "fail");
            String jsonResponse = null;
            try {
                jsonResponse = new ObjectMapper().writeValueAsString(json);
            } catch (JsonProcessingException e1) {
                throw new RuntimeException(e1);
            }
            return ResponseEntity.ok(jsonResponse);
        }
        json.put("message", "success");
        json.put("productID", productID);
        json.put("content", content);
        json.put("star", star);
        json.put("fullName", userCustom.getFullName());
        String jsonResponse = null;
        try {
            jsonResponse = new ObjectMapper().writeValueAsString(json);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        return ResponseEntity.ok(jsonResponse);
    }
}
