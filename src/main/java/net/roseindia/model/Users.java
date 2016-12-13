package net.roseindia.model;
import java.util.List;
import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.persistence.Embeddable;

@Entity
@Table(name = "users")
@SuppressWarnings("serial")
public class Users implements Serializable {


	@Id
	@GeneratedValue
	@Column(name = "id", length = 11 )
	private Long id;
	
	@Column(name = "user_name")
	String userName;

	@Column(name = "user_password")
	String userPassword;

	@Column(name= "role")
	String userrole;
	
	@Column(name="email")
	String email;
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	} 
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	} 
	



	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserrole() {
		return userrole;
	}

	public void setUserrole(String userName) {
		this.userrole = userName;
	}
	

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


}