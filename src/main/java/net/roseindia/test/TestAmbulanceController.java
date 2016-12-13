import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import net.roseindia.controllers.*;
import net.roseindia.form.*;
import net.roseindia.model.Users;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)
public class TestAmbulanceController {

	@Mock
	Map m;
	@Test
	public void test() {
		try{
		AmbulanceController controller=new AmbulanceController();
		Users users=new Users();
		users.setUserName("van");

		org.junit.Assert.assertEquals(controller.ambulance(m),"AmbToSdMsg");
		}
		catch(Exception e){}
	}
}
