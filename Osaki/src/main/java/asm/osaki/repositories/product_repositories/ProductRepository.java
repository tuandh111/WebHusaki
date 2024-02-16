package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("SELECT p FROM product p WHERE p.name LIKE %:keyword%")
    List<Product> searchProductByName(String keyword);

    Product findByProductID(Integer product_id);

}
