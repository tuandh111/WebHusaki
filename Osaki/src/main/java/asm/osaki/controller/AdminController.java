package asm.osaki.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm.osaki.entities.product.Category;
import asm.osaki.repositories.product_repositories.CategoryRepository;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping
	public String getHome(@RequestParam(name = "content", required = false) String content,@RequestParam(name = "categoryName", required = false) String categoryName,Model model) {
		if (content != null && !content.isEmpty()) {
			model.addAttribute("content", content);
			System.out.println(content);
			System.out.println(categoryName);
			if (content.equals("_content-category.jsp")) {
				model.addAttribute("categories", categoryRepository.findAll());
				if(categoryName!=null) {
					model.addAttribute("categories", categoryRepository.findByCategoryNameContainingIgnoreCase(categoryName));
				}
			}
		} else {
			model.addAttribute("content", "_dashboard3.jsp");
		}

		return "admin/admin";
	}

	@GetMapping("account-manager")
	public String accountManager(Model model) {
		return "redirect:/admin?content=_content-account.jsp";
	}
	// Category
	@GetMapping("category-manager")
	public String categoryManager(Model model) {
		return "redirect:/admin?content=_content-category.jsp";
	}
	
	@GetMapping("category-search")
	public String categorySearch(Model model,@RequestParam("categoryName") Optional<String> categoryName) {
		return "redirect:/admin?content=_content-category.jsp&categoryName="+categoryName.get();
	}
	
//	@GetMapping("search")
//	public void searchCategory(Model model, @RequestParam("categoryName") Optional<String> categoryName) {
//		model.addAttribute("categories", categoryRepository.findByCategoryNameContainingIgnoreCase(categoryName.get()));
//	}
	
	
	@GetMapping("product-manager")
	public String productManager(Model model, RedirectAttributes redirectAttributes) {
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
		return "redirect:/admin?content=__form-control-product.jsp&action=" + action;
	}

	@GetMapping("brand-manager")
	public String brandManager(Model model) {
		return "redirect:/admin?content=_content-brand.jsp";
	}
	
//	@ModelAttribute("categories")
//	public List<Category> getList(@RequestParam("categoryName") Optional<String> categoryName){
//		if (categoryName.isPresent()) {
//			return categoryRepository.findByCategoryNameContainingIgnoreCase(categoryName.get());
//		}else {
//			return categoryRepository.findAll();
//		}
//	}
}
