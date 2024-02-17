package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.Category;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category,Integer> {
	
	List<Category> findByCategoryNameContainingIgnoreCase(String categoryName);
}
