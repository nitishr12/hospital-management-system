import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;

public class TestValidationForm  {

	@Test
	public void test() {
		ValidationForm obj=new ValidationForm();
		String userName="check";
		Integer age=10;
		String password="checked";
		obj.setUserName(userName);
		obj.setPassword(password);
		obj.setAge(age);
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(password,obj.getPassword());
		org.junit.Assert.assertEquals(age,obj.getAge());

	}

}
