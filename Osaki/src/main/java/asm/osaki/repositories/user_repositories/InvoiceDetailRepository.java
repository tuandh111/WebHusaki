package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.InvoiceDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InvoiceDetailRepository extends JpaRepository<InvoiceDetail,Integer> {
    @Query("SELECT id.productID, p.name, COUNT(id.productID) FROM invoiceDetail id JOIN id.productID p GROUP BY id.productID, p.name ORDER BY COUNT(id.productID) DESC")
    List<Object[]> countProductsOrderByCountDesc();
    @Query("select  p from  invoiceDetail p where p.invoiceID = ?1")
    List<InvoiceDetail> findByInvoiceID(Integer id);

    @Query("SELECT COUNT(id) FROM invoiceDetail id WHERE id.productID.productID = :productID")
    List<Integer> countSoldProductsByProductID(@Param("productID") int productID);
}
