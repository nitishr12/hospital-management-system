
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
public class ambulance_msg implements Serializable {


	
	@Id
	@GeneratedValue
	@Column(name="S.No")
	int Sno;
	
	
	@Column(name="msg_id")
	int msgid;
	
	@Column(name = "userName")
	String userName;

	@Column(name = "Messages")
	String message;

	@Column(name="status")
	int status;
	
	@Column(name="seenstatus")
	int seenstatus;

	public int getId() {
		return Sno; 
	}
	public void setId(int Sno) {
		this.Sno = Sno;
	}
	
	public int getmsgId() {
		return msgid; 
	}
	public void setmsgId(int msgid) {
		this.msgid = msgid;
	}
	
	public String getuserName() {
		return userName; 
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}
	
	public String getmessage() {
		return message;
	}
	
	public void setmessage(String message) {
		this.message = message;
	}
	
	public int getstatus() {
		return status;
	}
	
	public void setstatus(int status) {
		this.status = status;
	}

	public int getseenstatus() {
		return seenstatus;
	}
	
	public void setseenstatus(int seenstatus) {
		this.seenstatus = seenstatus;
	}

}