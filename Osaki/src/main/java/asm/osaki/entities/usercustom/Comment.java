package asm.osaki.entities.usercustom;

import asm.osaki.entities.product.Product;
import asm.osaki.entities.usercustom.images_comment.ImageComment;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Data
@Table
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;
    @Nationalized
    private String  Content;
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;

    private int star=0;

    @ManyToOne
    @JoinColumn(name = "userCustom_id")
    private UserCustom userID;

    @OneToMany(mappedBy = "commentID")
    private List<ImageComment> images;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product  productID;
}
