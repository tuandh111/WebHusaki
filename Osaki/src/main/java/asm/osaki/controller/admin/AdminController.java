package asm.osaki.controller.admin;

import java.text.NumberFormat;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import asm.osaki.entities.product.Category;
import asm.osaki.entities.product.Product;
import asm.osaki.entities.product.image_product.ImageProduct;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.model.admin.CategoryAndCount;
import asm.osaki.model.admin.DataRevenueByCategory;
import asm.osaki.model.admin.InventoryTransactions;
import asm.osaki.model.admin.OrderInfo;
import asm.osaki.model.admin.ProductAdd;
import asm.osaki.model.admin.UserAndCount;
import asm.osaki.repositories.product_repositories.CategoryRepository;
import asm.osaki.repositories.product_repositories.ImageRepository;
import asm.osaki.repositories.product_repositories.ProductRepository;
import asm.osaki.repositories.statistics_repositories.OrderRepository;
import asm.osaki.model.admin.ProductLatest;

import asm.osaki.repositories.user_repositories.CommentRepository;
import asm.osaki.repositories.user_repositories.InvoiceDetailRepository;
import asm.osaki.repositories.user_repositories.InvoiceRepository;

import asm.osaki.repositories.user_repositories.UserCustomRepository;
import asm.osaki.service.ParamService;
import asm.osaki.service.SessionService;
import asm.osaki.service.VisitorCounter;
import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private ImageRepository imageRepository;
	@Autowired
	private ParamService paramService;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private UserCustomRepository userCustomRepository;
	@Autowired
	private InvoiceRepository invoiceRepository;
	@Autowired
	private InvoiceDetailRepository invoiceDetailRepository;
	@Autowired
	private CommentRepository commentRepository;
	@Autowired
	private OrderRepository orderRepository;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private VisitorCounter visitorCounter;

	@GetMapping
	public String getHome(@RequestParam(name = "content", required = false) String content,
			@RequestParam(name = "categoryName", required = false) String categoryName, Model model,
			@Valid @ModelAttribute("category") Category category, BindingResult result,
			@RequestParam("kwSearch") Optional<String> kw, @RequestParam("p") Optional<Integer> p) {

		if (content != null && !content.isEmpty()) {

			model.addAttribute("content", content);

			String keywordSearch = kw.orElse(sessionService.get("kwSearch", ""));
			sessionService.set("keywords", keywordSearch);
			System.out.println("keywordSearch" + keywordSearch);
			Pageable pageable = PageRequest.of(p.orElse(0), 5);
			Page<Object[]> page = null;

			if (content.equals("_content-category.jsp")) {
				page = categoryRepository.findAllByNameLike(keywordSearch, pageable);
				// System.out.println("categoryAndCount1: " + page.get().count());
				List<CategoryAndCount> convertedResults = CategoryAndCount.convert(page.getContent());
				// System.out.println("categoryAndCount: " + convertedResults.get(0).getName());
				model.addAttribute("categories", convertedResults);
			} else if (content.equals("_content-account.jsp")) {
				page = userCustomRepository.findAllByNameLike(keywordSearch, pageable);
				List<UserAndCount> convertedResults = UserAndCount.convert(page.getContent());
				model.addAttribute("users", convertedResults);
			} else if (content.equals("_content-product.jsp")) {
				page = productRepository.findAllByNameLikePro(keywordSearch, pageable);
				List<ProductAdd> convertedResults = ProductAdd.convert(page.getContent());
				model.addAttribute("item", convertedResults);
			} else if (content.equals("_content-order.jsp")) {
				page = orderRepository.findAllByNameLike(keywordSearch, pageable);
				List<OrderInfo> convertedResults = OrderInfo.convert(page.getContent());
				model.addAttribute("orders", convertedResults);
				System.out.println("orders " + convertedResults.toString());
			}

			if (page != null) {
				model.addAttribute("totalPages", page.getTotalPages());
				model.addAttribute("nextPage", page.getNumber() + 1);
				model.addAttribute("prevPage", page.getNumber() - 1);
				model.addAttribute("currentPage", page.getNumber() + 1);
				if (page.getNumber() + 1 > page.getTotalPages()) {
					model.addAttribute("currentPage", page.getTotalPages());
				}
				model.addAttribute("totalElements", page.getTotalElements());
				model.addAttribute("booleanFirst", page.isFirst());
				model.addAttribute("booleanLast", page.isLast());
			}

		} else {
			model.addAttribute("content", "_dashboard3.jsp");
		}

		NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
		model.addAttribute("totalInv", invoiceRepository.getTotalInvoice());
		model.addAttribute("totalRevenue", currencyFormat.format(invoiceRepository.getRevenue()));
		model.addAttribute("totalComments", commentRepository.getTotalComment());

		int visitorCount = visitorCounter.getCount();
		model.addAttribute("visitorCount", visitorCount);
		// Lấy 3 sản phẩm từ hóa đơn gần nhất
		Pageable pageable = PageRequest.of(p.orElse(0), 3);
		model.addAttribute("recentProduct",
				ProductLatest.convert(invoiceDetailRepository.findTop3ProductLatest(pageable)));

		// lấy tài khoản admin đăng nhập
		model.addAttribute("userAdminLogin", sessionService.get("userLogin"));

		// Biểu đồ line thống kê doanh thu theo danh mục
		List<DataRevenueByCategory> datas = DataRevenueByCategory.convert(categoryRepository.dataRevenueByCategory());
		Map<String, Double> dataRevenueByCategory = new HashMap<>();
		for (DataRevenueByCategory data : datas) {
			dataRevenueByCategory.put(data.getCategoryName(), data.getTotalAmount());
		}

		try {
			String dataRevenueByCategoryJson = objectMapper.writeValueAsString(dataRevenueByCategory);
			model.addAttribute("dataRevenueByCategory", dataRevenueByCategoryJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// Biểu đồ thống kê số lượng tồn kho theo sản phẩm
		// System.out.println("InventoryTransactions
		// "+InventoryTransactions.convert(productRepository.fetchInventoryTransactions()).toString());
		List<InventoryTransactions> inventories = InventoryTransactions
				.convert(productRepository.inventoryTransactions());
		Map<String, Double> dataInventories = new HashMap<>();
		for (InventoryTransactions data : inventories) {
			dataInventories.put(data.getName(), data.getQuantityInstock());
		}
		try {
			String dataInventoriesJson = objectMapper.writeValueAsString(dataInventories);
			model.addAttribute("dataInventory", dataInventoriesJson);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return "admin/admin";
	}

	// Category

	// user

	@GetMapping("add-or-edit-product")
	public String addOrEditProduct(@RequestParam(name = "action") String action, Model model) {
		model.addAttribute("action", action);
		List<Category> categories = categoryRepository.findAll(); // Lấy danh sách danh mục từ cơ sở dữ liệu
		model.addAttribute("categories", categories);
		return "redirect:/admin?content=__form-control-product.jsp&action=" + action;
	}

	@PostMapping("add-product")
	public String addProduct(@RequestParam(name = "productName") String nameProduct,
			@RequestParam(name = "price") Double priceProduct, @RequestParam(name = "quantity") Long quantityProduct,
			@RequestParam(name = "uses") String usesProduct, @RequestParam(name = "preserve") String preserveProduct,
			@RequestParam(name = "skinType") String skinTypeProduct,
			@RequestParam(name = "certification") String certificationProduct,
			@RequestParam(name = "dateOfManufacture") String dateOfManufactureProduct,
			@RequestParam(name = "expiry") String expiryProduct,
			@RequestParam(name = "categoryID") String categoryProduct,
			@RequestParam(name = "manufacturer") String manufacturerProduct,
			@RequestParam(name = "description") String descriptionProduct,
			@RequestPart(name = "image") MultipartFile fileImage) {
		Product product = new Product();
		product.setName(nameProduct);
		product.setPrice(priceProduct);
		product.setQuantityInStock(quantityProduct);
		product.setUses(usesProduct);
		product.setPreserve(preserveProduct);
		product.setSkinType(skinTypeProduct);
		product.setCertification(certificationProduct);
		product.setDateOfManufacture(paramService.getDate(dateOfManufactureProduct, "dd/MM/yyyy"));
		product.setExpiry(expiryProduct);
		product.setManufacturer(manufacturerProduct);
		product.setDescription(descriptionProduct);
		Category cate = categoryRepository.findById(Integer.parseInt(categoryProduct)).get();
		product.setCategoryID(cate);

		String upLoadDir = System.getProperty("user.dir") + "/uploadProduct/";
		System.out.println(upLoadDir);
		paramService.saveImgProduct(fileImage, upLoadDir);

		String ImageSP = fileImage.getOriginalFilename();

		ImageProduct imageProduct = new ImageProduct();

		imageProduct.setImageName(ImageSP);
		imageProduct.setProductID(product);

		productRepository.save(product);
		imageRepository.save(imageProduct);

		return "redirect:/admin?content=_content-product.jsp";
	}

	@GetMapping("logout")
	public String logout(@ModelAttribute("UserC") UserCustom userCustom) {
		sessionService.remove("userLogin");
		return "redirect:/login";
	}

}
