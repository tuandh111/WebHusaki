package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.Brand;
import asm.osaki.entities.product.Category;
import asm.osaki.entities.product.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    @Query("SELECT p FROM product p WHERE p.name LIKE %:keyword%")
    List<Product> searchProductByName(String keyword);

    Product findByProductID(Integer product_id);

    @Query("select  p from product p where p.categoryID.categoryID = :categoryID")
    List<Product> findByAllCategory(@Param("categoryID") int categoryID);

    @Query("select  p from product p where p.brandID.brandID = :brandID")
    List<Product> findByAllBrand(@Param("brandID") int brandID);


    Page<Product> findByCategoryIDAndBrandID(Category category, Brand Brand,
            Pageable pageable);

    Page<Product> findByCategoryID(Category categoryProduct, Pageable pageable);
}
