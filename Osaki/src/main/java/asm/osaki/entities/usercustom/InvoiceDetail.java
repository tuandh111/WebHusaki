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
public class InvoiceDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private double price;
    private double quantity;
    @Column(name = "createAt")
    private Date createAt = new Date();
    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;
    private Boolean isDelete;
    @ManyToOne
    @JoinColumn(name = "invoice_id")
    private Invoice invoiceID;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product productID;

}
