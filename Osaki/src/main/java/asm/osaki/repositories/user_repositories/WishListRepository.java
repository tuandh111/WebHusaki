package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.WishList;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WishListRepository extends JpaRepository<WishList,Integer> {
}
