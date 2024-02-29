package asm.osaki.controller.admin;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import asm.osaki.entities.product.FlashSale;
import asm.osaki.repositories.product_repositories.FlashSaleRepository;

import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/admin")
public class FlashSaleController {

    @Autowired
    private FlashSaleRepository flashSaleRepository;
    
    

    
  
}
