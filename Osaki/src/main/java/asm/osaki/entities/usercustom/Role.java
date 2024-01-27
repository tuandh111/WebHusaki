package asm.osaki.entities.usercustom;

import java.util.Date;
import java.util.List;

import jakarta.persistence.*;
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
	private String roleName;
	@Temporal(TemporalType.DATE)
	@Column(name = "createAt")
	private Date createAt= new Date();
	@Temporal(TemporalType.DATE)
	@Column(name = "deleteAt")
	private Date deleteAt;
	private Boolean isDelete;

	@OneToMany(mappedBy = "roleID")
	private List<UserCustom> role;

}
