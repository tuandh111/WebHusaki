package asm.osaki.repositories.user_repositories;

import asm.osaki.entities.user.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentRepository extends JpaRepository<Comment,Integer> {
}
