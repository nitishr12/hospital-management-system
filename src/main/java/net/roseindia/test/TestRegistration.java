import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;
 
public class TestRegistration {

	@Test
	public void test() {
		Registration obj=new Registration();
		String userName="dan";
		String confirmPassword="pass";
		String email="xyz@abc.com";
		obj.setUserName(userName);
		obj.setConfirmPassword(confirmPassword);
		String password=obj.getConfirmPassword();
		obj.setPassword(password);
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(password,obj.getPassword());
	}

}
