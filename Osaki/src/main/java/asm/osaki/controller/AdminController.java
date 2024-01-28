package asm.osaki.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

@RequestMapping("admin")
public class AdminController {

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
	public String productManager(Model model) {
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
}
