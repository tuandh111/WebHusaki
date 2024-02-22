package asm.osaki.controller.admin;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import asm.osaki.entities.product.Category;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.model.admin.CategoryAndCount;
import asm.osaki.model.admin.UserAndCount;
import asm.osaki.repositories.product_repositories.CategoryRepository;
import asm.osaki.repositories.user_repositories.UserCustomRepository;
import asm.osaki.service.SessionService;
import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private UserCustomRepository userCustomRepository;
	@Autowired
	private SessionService sessionService;
	@GetMapping
	public String getHome(@RequestParam(name = "content", required = false) String content,
			@RequestParam(name = "categoryName", required = false) String categoryName, Model model,
			@Valid @ModelAttribute("category") Category category, BindingResult result,
			@RequestParam("kwSearch") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		
		if (content != null && !content.isEmpty()) {
			
			model.addAttribute("content", content);
			
			
			String keywordSearch = kw.orElse(sessionService.get("kwSearch",""));
			sessionService.set("keywords", keywordSearch);
			System.out.println("keywordSearch" +keywordSearch);
			Pageable pageable = PageRequest.of(p.orElse(0), 5);
			Page<Object[]> page = null;
			
			
			if (content.equals("_content-category.jsp")) {				
				page = categoryRepository.findAllByNameLike(keywordSearch, pageable);
				List<CategoryAndCount> convertedResults = CategoryAndCount.convert(page.getContent());
				model.addAttribute("categories", convertedResults);							
			}else if(content.equals("_content-account.jsp")) {			
				page = userCustomRepository.findAllByNameLike(keywordSearch, pageable);
				List<UserAndCount> convertedResults = UserAndCount.convert(page.getContent());
				model.addAttribute("users", convertedResults);
			}
			
			
			if(page!=null) {
				model.addAttribute("totalPages", page.getTotalPages());
				model.addAttribute("nextPage", page.getNumber()+1);
				model.addAttribute("prevPage", page.getNumber()-1);
				model.addAttribute("currentPage", page.getNumber()+1);
				if( page.getNumber()+1 >page.getTotalPages()) {
					model.addAttribute("currentPage",  page.getTotalPages());
				}
				model.addAttribute("totalElements", page.getTotalElements());
				model.addAttribute("booleanFirst", page.isFirst());
				model.addAttribute("booleanLast", page.isLast());
			}
			
		} else {
			model.addAttribute("content", "_dashboard3.jsp");
		}
		return "admin/admin";
	}

//Category
	@GetMapping("add-category")
	public String addCategoryManager(@Valid @ModelAttribute("category") Category category, BindingResult result ) {
		 if(result.hasErrors()) {
			 return "redirect:/admin?content=_content-category.jsp";
		 }
		 category.setDeleteAt(null);
		 category.setProducts(null);
		 category.setIsDelete(!category.getIsDelete());
		 categoryRepository.save(category);
		// System.out.println("post cate "+ category.getIsDelete());
		return "redirect:/admin?content=_content-category.jsp";
	}
	
	@GetMapping("delete-category/{id}")
	public String deleteCategoryManager(@PathVariable("id") Integer id) {
		Optional<Category> categoryOpt = categoryRepository.findById(id);
		Category category =categoryOpt.get();
		category.setIsDelete(true);
		category.setDeleteAt(new Date());
		categoryRepository.save(category);
		return "redirect:/admin?content=_content-category.jsp";
	}
	
	@PostMapping("edit-category")
	public String editCategoryManager(@RequestParam("categoryID") Integer categoryID,
			@RequestParam("categoryName") String categoryName,
			@RequestParam("isDelete") Optional<Boolean> isDelete) {
		Optional<Category> categoryOpt = categoryRepository.findById(categoryID);
		Category category =categoryOpt.get();
		category.setCategoryName(categoryName);		
		if(isDelete.isPresent()) {
			category.setIsDelete(!isDelete.get());
		}else {
			category.setIsDelete(true);
		}
		categoryRepository.save(category);
		return "redirect:/admin?content=_content-category.jsp";
	}

	@GetMapping("category-search")
	public String categorySearch(Model model, @RequestParam("kwSearch") Optional<String> categoryNameSearch) {
		return "redirect:/admin?content=_content-category.jsp&kwSearch=" + categoryNameSearch.get();
	}

	// user
	
	@GetMapping("user-search")
	public String userSearch(Model model, @RequestParam("kwSearch") Optional<String> userNameSearch) {
		return "redirect:/admin?content=_content-account.jsp&kwSearch=" + userNameSearch.get();
	}
	@GetMapping("edit-user/{id}")
	public String editUser(@PathVariable("id") Integer id,@RequestParam("isDelete") Optional<Boolean> isDelete) {
		UserCustom user = userCustomRepository.findByUserID(id);			
		Boolean delete =isDelete.orElse(false);		
		user.setDeleteAt(new Date());
		user.setIsDelete(!delete);
		userCustomRepository.save(user);			
		return "redirect:/admin?content=_content-account.jsp";
	}
	


	@GetMapping("add-or-edit-product")
	public String addOrEditProduct(@RequestParam(name = "action") String action, Model model) {
		model.addAttribute("action", action);
		return "redirect:/admin?content=__form-control-product.jsp&action=" + action;
	}
	
}
