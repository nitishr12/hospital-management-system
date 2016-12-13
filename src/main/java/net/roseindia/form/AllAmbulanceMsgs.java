package net.roseindia.form;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class AllAmbulanceMsgs {

private int msg_id;
private String userName;
private String Messages;
private int status;

public void setid(int msg_id) {
	this.msg_id = msg_id;
}

public int getid() {
	return msg_id;
}

public void setuname(String userName) {
	this.userName = userName;
}

public String getuname() {
	return userName;
}


public void setmsg(String Messages) {
	this.Messages = Messages;
}

public String getmsg() {
	return Messages;
}

public void setstatus(int status) {
	this.status = status;
}

public int getstatus() {
	return status;
}


}
