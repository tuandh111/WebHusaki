package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product,String> {
}
