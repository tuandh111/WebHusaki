package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.InvoiceDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceDetailRepository extends JpaRepository<InvoiceDetail,Integer> {
}
