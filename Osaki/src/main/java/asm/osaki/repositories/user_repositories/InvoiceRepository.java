package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice,String> {
}
