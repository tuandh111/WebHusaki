package asm.osaki.entities.usercustom;


import asm.osaki.entities.product.Product;
import jakarta.persistence.*;
import org.hibernate.annotations.Nationalized;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Data
@Table
public class UserCustom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userID;

    private String email;

    private String googleID;

    private String facebookID;
    @Nationalized
    private String fullName;

    private String imgage;

    private String password;

    private String verifyCode;
    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;
    @ManyToOne
    @JoinColumn(name = "role")
    private Role roleID;

    @OneToMany(mappedBy = "userID")
    private List<Address> addresses;

    @OneToMany(mappedBy = "userID")
    private List<Voucher> vouchers;

    @OneToMany(mappedBy = "userID")
    private List<Comment> comments;

    @OneToMany(mappedBy = "userID")
    private List<CardVNPay> cardVNPays;

    @OneToMany(mappedBy = "userID")
    private List<Invoice> invoices;

    @OneToMany(mappedBy = "userID")
    private List<WishList> wishLists;

    @OneToMany(mappedBy = "userID")
    private List<Product> user_custom_id;
}
