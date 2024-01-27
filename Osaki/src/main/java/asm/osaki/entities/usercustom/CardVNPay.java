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
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;
    private double amount;
    private String productCard;
    private String backCode;
    @ManyToOne
    @JoinColumn(name = "cardVNPays")
    private UserCustom userID;

}
