package asm.osaki.entities.usercustom;

import asm.osaki.entities.usercustom.UserCustom;
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
public class Voucher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String discount;

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    @Column
    private Boolean isDelete;

    @ManyToOne
    @JoinColumn(name = "vouchers")
    private UserCustom userID;

}
