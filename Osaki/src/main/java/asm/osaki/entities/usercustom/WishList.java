package asm.osaki.entities.usercustom;

import asm.osaki.entities.product.Product;
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
public class WishList {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  int id;

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    @Column
    private Boolean isDelete;

    @ManyToOne
    @JoinColumn(name = "userCustom_id")
    private UserCustom userID;


    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product productID;
}
