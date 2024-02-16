package asm.osaki.repositories.product_repositories;

import asm.osaki.entities.product.FlashSale;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FlashSaleRepository extends JpaRepository<FlashSale, Integer> {
    FlashSale findByIsStatus(boolean status);
}
