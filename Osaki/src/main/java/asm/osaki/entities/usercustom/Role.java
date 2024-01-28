package asm.osaki.entities.usercustom;

import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Nationalized;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Data
@Table
public class Role {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleID;

	@Nationalized
	@NotNull(message = "Khong duoc de trong ten")
	private String roleName;

	@Temporal(TemporalType.DATE)
	@Column(name = "createAt")
	private Date createAt= new Date();

	@Temporal(TemporalType.DATE)
	@Column(name = "deleteAt")
	private Date deleteAt;

	@Column
	private Boolean isDelete;

	@OneToMany(mappedBy = "roleID")
	private List<UserCustom> role;

}
