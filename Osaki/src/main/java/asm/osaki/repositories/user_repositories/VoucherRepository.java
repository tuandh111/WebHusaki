package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoucherRepository extends JpaRepository<Voucher,Integer> {
}
