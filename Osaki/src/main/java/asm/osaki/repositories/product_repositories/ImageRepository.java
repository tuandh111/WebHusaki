package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.image_product.ImageProduct;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepository extends JpaRepository<ImageProduct,String> {
}
