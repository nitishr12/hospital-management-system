import static org.junit.Assert.*;
import net.roseindia.model.*;
import org.junit.Test;

public class TestUsers_model  {

	@Test
	public void test() {
		Users obj=new Users();
		Long id=(long) 123;
		String userName="dan";
		String userPassword="pass";
		String userrole="doctor";
		obj.setId(id);
		obj.setUserName(userName);
		obj.setUserrole(userrole);
		obj.setUserPassword(userPassword);
		org.junit.Assert.assertEquals(id,obj.getId());
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(userPassword,obj.getUserPassword());
		org.junit.Assert.assertEquals(userrole,obj.getUserrole());
	}

}
