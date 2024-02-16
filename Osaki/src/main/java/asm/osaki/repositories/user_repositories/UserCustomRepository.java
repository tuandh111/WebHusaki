package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.UserCustom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserCustomRepository extends JpaRepository<UserCustom, Integer> {
    UserCustom findByEmail(String email);

    UserCustom findByGoogleIDLike(String googleID);

    UserCustom findByFacebookIDLike(String facebookID);
}
