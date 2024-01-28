package asm.osaki.entities.product;

import asm.osaki.entities.product.image_product.ImageProduct;
import asm.osaki.entities.user.Comment;
import asm.osaki.entities.user.InvoiceDetail;
import asm.osaki.entities.user.UserCustom;
import asm.osaki.entities.user.WishList;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
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

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    @Column
    private Boolean isDelete;

    @Column
    @NotNull(message = "Vui lòng nhập giá sản phẩm")
    @DecimalMin(value = "1", message = "Giá sản phẩm phải lớn 0")
    private double price;

    @Column
    private String name;

    @Column
    @NotNull(message = "Vui lòng nhập số lượng trong kho")
    @Min(value = 1, message = "Số lượng phải lớn 0")
    @Digits(integer = 32, fraction = 0, message = "Số lượng phải là số nguyên")
    private long quantityInStock;

    @Nationalized
    private String uses;

    @Nationalized
    private String preserve;
    @Nationalized

    private String skinType;

    @Nationalized
    private String certification;

    @Temporal(TemporalType.DATE)
    private Date DateOfManufacture;

    @Column
    @Nationalized
    private String expiry;

    @Nationalized
    @Column
    @NotNull(message = "Vui lòng chọn thương hiệu")
    private String manufacturer;

    @Nationalized
    @Column
    private String ingredient;

    @Column
    @Nationalized
    private String description;

    @ManyToOne
    @JsonManagedReference
    @JoinColumn(name = "user_custom_id")
    private UserCustom userID;

    @ManyToOne
    @JsonManagedReference
    @NotNull(message = "Vui lòng chọn loại sản phẩm")
    @JoinColumn(name = "category_id")
    private Category categoryID;

    @ManyToOne
    @JsonManagedReference
    @JoinColumn(name = "cosmetic_form_id")
    private CosmeticForm cosmeticFormID;

    @ManyToOne
    @JsonManagedReference
    @JoinColumn(name = "brand_id")
    private Brand brandID;

    @OneToMany(mappedBy = "productID")
    @JsonManagedReference
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
