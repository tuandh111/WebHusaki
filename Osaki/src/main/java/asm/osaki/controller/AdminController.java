package asm.osaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller

@RequestMapping("admin")
public class AdminController {

	@GetMapping
	public String getHome(Model model) {
//		String content = (String) session.getAttribute("content");
//        model.addAttribute("content", content != null ? content : "_content.jsp");
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
//		redirectAttributes.addFlashAttribute("content","_content-product.jsp");
//        return "redirect:/admin";
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
