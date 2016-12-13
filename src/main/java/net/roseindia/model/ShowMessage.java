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
@Table(name = "messages")
@SuppressWarnings("serial")
public class ShowMessage implements Serializable {


	@Id
	@GeneratedValue
	@Column(name = "S.No", length = 100 )
	private Long Sno;
	
	@Column(name = "userName")
	String userName;

	@Column(name = "Messages")
	String Messages;

	public Long getId() {
		return Sno;
	}


	public void setId(Long Sno) {
		this.Sno = Sno;
	} 



	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

	public String getMessage() {
		return Messages;
	}

	public void setMessage(String Messages) {
		this.Messages = Messages;
	}


}