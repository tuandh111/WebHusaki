package asm.osaki.repositories.product_repositories;

import java.util.List;

import asm.osaki.entities.product.PromotionalDetails;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface PromotionalDetailsRepository extends JpaRepository<PromotionalDetails, Integer> {

    List<PromotionalDetails> findByFlashSale_Id(int id);

    Page<PromotionalDetails> findByFlashSale_Id(int id, Pageable pageable);

    @Query("SELECT c FROM PromotionalDetails c WHERE c.productID.productID = :productId")
    PromotionalDetails findByProductId(String productId);
}
