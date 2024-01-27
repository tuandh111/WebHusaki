package asm.osaki.entities.usercustom;

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
public class Invoice {
    @Id
    private String Invoice;
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;
    @Nationalized
    private String note;
    private String status;
    private double totalAmount;
    @ManyToOne
    @JoinColumn(name = "invoices")
    private UserCustom userID;

    @OneToMany(mappedBy = "invoiceID")
    private List<InvoiceDetail> invoiceDetails;


}
