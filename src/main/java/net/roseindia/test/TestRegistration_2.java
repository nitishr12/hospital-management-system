import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;

public class TestRegistration_2  {

	@Test
	public void test() {
		Registration obj=new Registration();
		String userName="dan";
		String password="pass";
		String confirmpassword="pass";
		String email="abc@gmail.com";
		obj.setUserName(userName);
		obj.setPassword(password);
		obj.setConfirmPassword(confirmpassword);
		obj.setEmail(email);
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(password,obj.getPassword());
		org.junit.Assert.assertEquals(confirmpassword,obj.getConfirmPassword());
		org.junit.Assert.assertEquals(email,obj.getEmail());

	}

}
