package asm.osaki.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm.osaki.service.SessionService;
import jakarta.servlet.http.HttpSession;


@Controller

@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private SessionService session;

//	@GetMapping
//	public String getHome(Model model) {
//	    String content = session.get("content","_content.jsp");
//	    if (content != null) {
//	        model.addAttribute("content", content);
//	        session.remove("content");
//	    } else {
//	        model.addAttribute("content", "_content.jsp");
//	    }
//	    return "admin/admin";
//	}
//	
//
//	@GetMapping("account-manager")
//	public String accountManager() {
//		session.set("content", "_content-account.jsp");
//	    return "redirect:/admin";
//	}
//	
//	@GetMapping("category-manager")
//	public String categoryManager() {
//		session.set("content", "_content-category.jsp");
//	    return "redirect:/admin";
//	}
//	
//	@GetMapping("product-manager")
//	public String productManager() {
//		session.set("content", "_content-product.jsp");
//		return "redirect:/admin";
//	}
	
	
	
	@GetMapping
	public String getHome(Model model) {
		model.addAttribute("content","_content.jsp");
		return "admin/admin";
	}
	
	@GetMapping("account-manager")
	public String accountManager(Model model) {
		model.addAttribute("content","_content-account.jsp");
		return "admin/admin";
	}
	
	@GetMapping("category-manager")
	public String categoryManager(Model model) {
		model.addAttribute("content","_content-category.jsp");
		return "admin/admin";
	}
	
	@GetMapping("product-manager")
	public String productManager(Model model,RedirectAttributes redirectAttributes) {
		model.addAttribute("content","_content-product.jsp");
		return "admin/admin";
	}
	
	@GetMapping("revenue-statistics")
	public String revenueStatistics(Model model) {
		model.addAttribute("content","_content-revenue-statistics.jsp");
		return "admin/admin";
	}
	
	@GetMapping("product-statistics")
	public String productStatistics(Model model) {
		model.addAttribute("content","_content-product-statistics.jsp");
		return "admin/admin";
	}
	
	@GetMapping("account-statistics")
	public String accountStatistics(Model model) {
		model.addAttribute("content","_content-account-statistics.jsp");
		return "admin/admin";
	}
	
	@GetMapping("category-statistics")
	public String categoryStatistics(Model model) {
		model.addAttribute("content","_content-category-statistics.jsp");
		return "admin/admin";
	}
	
	@GetMapping("add-or-edit-product")
	public String addOrEditProduct(Model model) {
		model.addAttribute("content","__form-control-product.jsp");
		return "admin/admin";
	}
}
