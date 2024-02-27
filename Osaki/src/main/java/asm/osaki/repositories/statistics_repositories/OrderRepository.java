package asm.osaki.repositories.statistics_repositories;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.osaki.entities.user.InvoiceDetail;

public interface OrderRepository extends JpaRepository<InvoiceDetail, Integer> {	
	@Query("SELECT p, u, i, a " +
            "FROM invoice i " +
            "INNER JOIN invoiceDetail id ON id.invoiceID.invoiceID = i.invoiceID " +
            "INNER JOIN product p ON id.productID.productID = p.productID " +
            "INNER JOIN user_custom u ON u.userID = i.user.userID " +
            "INNER JOIN UserAddress a ON a.user.userID = u.userID " +
            "WHERE p.name like %?1% " +
            "GROUP BY p, u, i, a "+
            "ORDER BY i.createAt DESC")
	Page<Object[]> findAllByNameLike(String keywords,Pageable pageable);
	
	@Query("SELECT p, u, i, a " +
            "FROM invoice i " +
            "INNER JOIN invoiceDetail id ON id.invoiceID.invoiceID = i.invoiceID " +
            "INNER JOIN product p ON id.productID.productID = p.productID " +
            "INNER JOIN user_custom u ON u.userID = i.user.userID " +
            "INNER JOIN UserAddress a ON a.user.userID = u.userID " +
            "WHERE i.status like %?1% " +
            "GROUP BY p, u, i, a "+
            "ORDER BY i.createAt DESC")
	List<Object[]> findAllOrderCancel(String keywords);
	
	//check
}
