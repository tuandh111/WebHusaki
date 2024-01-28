package asm.osaki.entities.usercustom;

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
public class CardVNPay {
    @Id
    private String id;

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    @Column
    private Boolean isDelete;

    @Column
    private double amount;

    @Column
    private String productCard;

    @Column
    private String backCode;

    @ManyToOne
    @JoinColumn(name = "cardVNPays")
    private UserCustom userID;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id", referencedColumnName = "invoiceID")
    private Invoice invoiceID;

}
