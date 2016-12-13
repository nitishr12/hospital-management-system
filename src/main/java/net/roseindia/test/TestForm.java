import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;

public class TestForm  {

	@Test
	public void test() {
		LoginForm obj=new LoginForm();
		String userName="dan";
		String password="pass";
		obj.setUserName(userName);
		obj.setPassword(password);
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(password,obj.getPassword());
	}

}
