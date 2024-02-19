package asm.osaki.controller;

import asm.osaki.entities.user.UserCustom;
import asm.osaki.repositories.user_repositories.AddressRepository;
import asm.osaki.service.ParamService;
import asm.osaki.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ConTactController {
    @Autowired
    SessionService sessionService;
    @Autowired
    AddressRepository addressRepository;

    @Autowired
    ParamService paramService;
    @GetMapping("/contact")
    public String contactController(@ModelAttribute("UserC") UserCustom userCustom, Model model) {
        UserCustom userCustom1 = sessionService.get("userLogin");
        model.addAttribute("address",addressRepository.findByUser(userCustom1));
        model.addAttribute("userLogin",userCustom1);
        return "contact";
    }
    @PostMapping("post-contact")
    public ResponseEntity<?>  postContact(){
        String email =paramService.getString("email","");
        System.out.println("postEmail: "+ email);
        return ResponseEntity.ok("success");
    }
}
