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
    Page<Product> searchProductByName(String keyword, Pageable pageable);

    Product findByProductID(Integer product_id);

    @Query("select  p from product p where p.categoryID.categoryID = :categoryID")
    Page<Product> findByAllCategory(@Param("categoryID") int categoryID, Pageable pageable);

    @Query("select  p from product p where p.brandID.brandID = :brandID")
    Page<Product> findByAllBrand(@Param("brandID") int brandID, Pageable pageable);


    Page<Product> findByCategoryIDAndBrandID(Category category, Brand Brand, Pageable pageable);

    Page<Product> findByCategoryID(Category categoryProduct, Pageable pageable);

    @Query("SELECT p FROM product p ORDER BY p.price ASC")
    Page<Product> findProductsByPriceRangeOrderByPriceAsc(Pageable pageable);

    @Query("SELECT p FROM product p ORDER BY p.price DESC")
    Page<Product> findProductsByPriceRangeOrderByPriceDesc(Pageable pageable);

    @Query("SELECT p FROM product p WHERE p.price >= :minPrice AND p.price <= :maxPrice")
    Page<Product> findProductsByPriceRange(@Param("minPrice") double minPrice, @Param("maxPrice") double maxPrice, Pageable pageable);

}
