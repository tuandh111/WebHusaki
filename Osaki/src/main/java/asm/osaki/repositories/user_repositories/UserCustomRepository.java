package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.UserCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserCustomRepository extends JpaRepository<UserCustom,Integer> {
}
