package asm.osaki.entities.product;

import asm.osaki.entities.product.image_product.ImageProduct;
import asm.osaki.entities.usercustom.Comment;
import asm.osaki.entities.usercustom.InvoiceDetail;
import asm.osaki.entities.usercustom.UserCustom;
import asm.osaki.entities.usercustom.WishList;
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
public class Product {
    @Id
    private String productID;
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;

    private double price;

    private String name;

    private long quantityInStock;

    @Nationalized
    private  String uses;

    @Nationalized
    private  String preserve;
    @Nationalized

    private String skinType;

    @Nationalized
    private String certification;

    @Temporal(TemporalType.DATE)
    private Date DateOfManufacture;
    @Nationalized

    private String expiry;
    @Nationalized

    private String manufacturer;
    @Nationalized

    private String ingredient;
    @Nationalized

    private String description;

    @ManyToOne
    @JoinColumn(name = "user_custom_id")
    private UserCustom userID;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category categoryID;

    @ManyToOne
    @JoinColumn(name = "cosmetic_form_id")
    private CosmeticForm cosmeticFormID;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brandID;

    @OneToMany(mappedBy = "productID")
    private List<ImageProduct> productImages;

    @OneToMany(mappedBy = "productID")
    private List<NetWeight> netWeights;

    @OneToMany(mappedBy = "productID")
    private List<Comment> comments;

    @OneToMany(mappedBy = "productID")
    private List<WishList> wishLists;

    @OneToMany(mappedBy = "productID")
    private List<InvoiceDetail> invoiceDetails;
}
