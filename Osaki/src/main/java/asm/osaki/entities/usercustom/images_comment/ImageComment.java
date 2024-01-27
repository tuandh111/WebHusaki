package asm.osaki.entities.usercustom.images_comment;

import asm.osaki.entities.usercustom.Comment;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Data
@Table
public class ImageComment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String imageName;

    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;

    @ManyToOne
    @JoinColumn(name = "images")
    private Comment commentID;
}
