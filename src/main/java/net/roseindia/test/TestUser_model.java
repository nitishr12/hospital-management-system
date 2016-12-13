import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import net.roseindia.model.*;
import org.junit.Test;

public class TestUser_model  {

	@Test
	public void test() throws ParseException {
		User obj=new User();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		String userName="dan";
		String password="pass";
			String email="abc@gmail.com";
			Date birthdate=fmt.parse("2016-10-10");
			String profession="doctor";
		obj.setUsername(userName);
		obj.setPassword(password);
		obj.setBirthDate(birthdate);
		obj.setEmail(email);
		obj.setProfession(profession);
		org.junit.Assert.assertEquals(userName,obj.getUsername());
		org.junit.Assert.assertEquals(password,obj.getPassword());
		org.junit.Assert.assertEquals(birthdate,obj.getBirthDate());
		org.junit.Assert.assertEquals(email,obj.getEmail());
			org.junit.Assert.assertEquals(profession,obj.getProfession());

	}

}
