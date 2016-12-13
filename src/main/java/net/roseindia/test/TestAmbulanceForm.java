import static org.junit.Assert.*;
import net.roseindia.form.*;
import org.junit.Test;

public class TestAmbulanceForm  {

	@Test
	public void test() {
		AmbulanceForm obj=new AmbulanceForm();
		String userName="check";
		String message="messaging...";
		obj.setUserName(userName);
		obj.setmessage(message);
		org.junit.Assert.assertEquals(userName,obj.getUserName());
		org.junit.Assert.assertEquals(message,obj.getmessage());

	}

}
