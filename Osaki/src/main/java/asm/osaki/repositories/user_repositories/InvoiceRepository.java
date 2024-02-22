package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.Invoice;
import asm.osaki.entities.user.InvoiceDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice,String> {
    @Query("select  p from  invoice p where p.invoiceID = :invoiceID")
    Invoice findByInvoiceID(@Param("invoiceID") String id);
    @Query("select  p from  invoice p where p.user.userID = :userID")
    List<Invoice> findByUserID(@Param("userID") Integer id);
    
    @Query("select count(i) from  invoice i")
    Integer getTotalInvoice();
    @Query("select sum(i.totalAmount) from  invoice i")
    Double getRevenue();
//    @Query(value = "select top 5 * from invoice order by create_at desc", nativeQuery = true)
//    List<Invoice> findTop5ByOrderByCreateAtDesc();
}
