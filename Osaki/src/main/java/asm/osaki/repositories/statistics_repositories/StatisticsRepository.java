package asm.osaki.repositories.statistics_repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import asm.osaki.entities.user.InvoiceDetail;

public interface StatisticsRepository extends JpaRepository<InvoiceDetail, Integer> {
	@Query("SELECT p, SUM(i.totalAmount) " + "FROM product p "
			+ "INNER JOIN invoiceDetail id ON p.productID = id.productID.productID "
			+ "INNER JOIN invoice i ON id.invoiceID.invoiceID = i.invoiceID " + "GROUP BY p "
			+ "ORDER BY p.name ASC")
	List<Object[]> dataRevenueByProduct();

	@Query("SELECT MONTH(i.createAt), SUM(i.totalAmount) " + "FROM invoice i " + "GROUP BY MONTH(i.createAt) "
			+ "ORDER BY MONTH(i.createAt) ASC")
	List<Object[]> dataRevenueByMonth();
}
