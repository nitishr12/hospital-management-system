package net.roseindia.form;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
public class AmbulanceForm {
	@NotEmpty
	@Size(min = 1, max = 50)
	private String userName;
	@NotEmpty
	@Size(min = 1, max = 1000)
	private String message;

	private int id;
	private int status;
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName() {
		//System.out.println(userName);
		return userName;
	}
	public void setmessage(String message) {
		this.message = message;
	}
	public String getmessage() {
		//System.out.println(mesge);
		return message;
	}
	
	public void setid(int id) {
		this.id = id;
	}
	public int getid() {
		//System.out.println(mesge);
		return id;
	}
	
	public void setstatus(int status) {
		this.status = status;
	}
	public int getstatus() {
		//System.out.println(mesge);
		return status;
	}
}
