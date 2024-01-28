package asm.osaki.entities.user;


import asm.osaki.entities.product.Product;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
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

    @Column
    @Email(message = "Email không hợp lệ")
    private String email;

    @Column
    private String googleID;

    @Column
    private String facebookID;

    @Column
    @Nationalized
    @NotBlank(message = "Vui lòng nhập họ tên")
    @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]*$", message = "Họ tên không hợp lệ")
    private String fullName;

    @Column
    private String imgage;

    @Column
    @NotBlank(message = "Vui lòng nhập mật khẩu")
    @Size(min = 6, message = "Mật khẩu phải chứa ít nhất 6 ký tự")
    @Pattern(regexp = ".*[a-zA-Z].*", message = "Mật khẩu phải chứa ít nhất một chữ cái")
    private String password;

    @Column
    private String verifyCode;

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    @Column
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
