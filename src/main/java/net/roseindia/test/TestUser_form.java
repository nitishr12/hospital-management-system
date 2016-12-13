import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;

public class TestUser_form  {

	@Test
	public void test() {
		User obj=new User();
		String userName="dan";

		obj.setUserName(userName);
		org.junit.Assert.assertEquals(userName,obj.getUserName());


	}

}
