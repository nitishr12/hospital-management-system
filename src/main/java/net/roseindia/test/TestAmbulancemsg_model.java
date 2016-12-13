import static org.junit.Assert.*;
import net.roseindia.model.*;
import org.junit.Test;

public class TestAmbulancemsg_model  {

	@Test
	public void test() {
		ambulance_msg obj=new ambulance_msg();
		String userName="check";
		String message="messaging...";
		obj.setuserName(userName);
		obj.setmessage(message);
		org.junit.Assert.assertEquals(userName,obj.getuserName());
		org.junit.Assert.assertEquals(message,obj.getmessage());

	}

}
