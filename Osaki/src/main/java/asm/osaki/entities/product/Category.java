package asm.osaki.entities.product;

import jakarta.persistence.*;
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
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryID;

    @Column
    private String categoryName;

    @Temporal(TemporalType.DATE)
    @Column(name = "createAt")
    private Date createAt = new Date();

    @Temporal(TemporalType.DATE)
    @Column(name = "deleteAt")
    private Date deleteAt;

    private Boolean isDelete;

    @OneToMany(mappedBy = "categoryID")
    List<Product> products;
}
