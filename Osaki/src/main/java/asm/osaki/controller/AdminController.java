package asm.osaki.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping("admin")
public class AdminController {
	
	@GetMapping
	public String getHome(@RequestParam(name = "content", required = false) String content,Model model) {
		 if (content != null && !content.isEmpty()) {
		        model.addAttribute("content", content);
		        System.out.println(content);
		    } else {		        
		        model.addAttribute("content", "_dashboard3.jsp");
		    }
		 
		return "admin/admin";
	}
	
	@GetMapping("account-manager")
	public String accountManager(Model model) {	
		return "redirect:/admin?content=_content-account.jsp";
	}
	
	@GetMapping("category-manager")
	public String categoryManager(Model model) {
		return "redirect:/admin?content=_content-category.jsp";
	}
	
	@GetMapping("product-manager")
	public String productManager(Model model,RedirectAttributes redirectAttributes) {
		return "redirect:/admin?content=_content-product.jsp";
	}
	
	@GetMapping("revenue-statistics")
	public String revenueStatistics(Model model) {	
		return "redirect:/admin?content=_content-revenue-statistics.jsp";
	}
	
	@GetMapping("product-statistics")
	public String productStatistics(Model model) {
		return "redirect:/admin?content=_content-product-statistics.jsp";
	}
	
	@GetMapping("account-statistics")
	public String accountStatistics(Model model) {
		return "redirect:/admin?content=_content-account-statistics.jsp";
	}
	
	@GetMapping("category-statistics")
	public String categoryStatistics(Model model) {
		return "redirect:/admin?content=_content-category-statistics.jsp";
	}
	
	@GetMapping("add-or-edit-product")
	public String addOrEditProduct(@RequestParam(name = "action") String action, Model model) {
		model.addAttribute("action", action);
		return "redirect:/admin?content=__form-control-product.jsp&action="+action;
	}
	
	@GetMapping("brand-manager")
	public String brandManager(Model model) {
		return "redirect:/admin?content=_content-brand.jsp";
	}
}
