package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product,String> {
	
}
