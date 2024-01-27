package asm.osaki.entities;



import org.hibernate.annotations.Nationalized;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// @NoArgsConstructor
// @AllArgsConstructor
// @Entity
// @Data
public class User {

	//@Id
	// private String UserId;

	// @ManyToOne
	// @JoinColumn(name = "RoleID")
	// private Role roleName;
	
	// @Column
	// @Nationalized
	// @NotBlank(message = "Vui lòng nhập họ tên")
    // @Pattern(regexp = "^[a-zA-ZÀ-ỹ\\s]*$", message = "Họ tên không hợp lệ")
	// private String fullname;
	
	// @Column
	// private String image;
	
	// @Column
    // @NotBlank(message = "Vui lòng nhập mật khẩu")
    // @Size(min = 6, message = "Mật khẩu phải chứa ít nhất 6 ký tự")
    // @Pattern(regexp = ".*[a-zA-Z].*", message = "Mật khẩu phải chứa ít nhất một chữ cái")
    // private String password;

	// @Column
	// @Email(message = "Email không hợp lệ")
	// private String email;
	
	// @Column
	// private String verifyCode;
	
	// @Column
	// private boolean del;
	
}
