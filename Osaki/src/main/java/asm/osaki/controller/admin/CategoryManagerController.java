package asm.osaki.controller.admin;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.osaki.entities.product.Category;
import asm.osaki.repositories.product_repositories.CategoryRepository;
import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class CategoryManagerController {
	@Autowired
	private CategoryRepository categoryRepository;

	@GetMapping("add-category")
	public String addCategoryManager(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:/admin?content=_content-category.jsp";
		}
		category.setDeleteAt(null);
		category.setProducts(null);
		category.setIsDelete(!category.getIsDelete());
		categoryRepository.save(category);
		return "redirect:/admin?content=_content-category.jsp";
	}

	@GetMapping("delete-category/{id}")
	public String deleteCategoryManager(@PathVariable("id") Integer id) {
		Optional<Category> categoryOpt = categoryRepository.findById(id);
		Category category = categoryOpt.get();
		category.setIsDelete(true);
		category.setDeleteAt(new Date());
		categoryRepository.save(category);
		return "redirect:/admin?content=_content-category.jsp";
	}

	@PostMapping("edit-category")
	public String editCategoryManager(Model model, @PathVariable("id") @RequestParam("categoryID") Integer categoryID,
			@RequestParam("categoryName") String categoryName, @RequestParam("isDelete") Optional<Boolean> isDelete) {
		Optional<Category> categoryOpt = categoryRepository.findById(categoryID);
		Category category = categoryOpt.get();
		category.setCategoryName(categoryName);
		if (isDelete.isPresent()) {
			category.setIsDelete(!isDelete.get());
		} else {
			category.setIsDelete(true);
		}

		categoryRepository.save(category);
		return "redirect:/admin?content=_content-category.jsp";
	}

	@GetMapping("category-search")
	public String categorySearch(Model model, @RequestParam("kwSearch") Optional<String> categoryNameSearch) {
		return "redirect:/admin?content=_content-category.jsp&kwSearch=" + categoryNameSearch.get();
	}
}
