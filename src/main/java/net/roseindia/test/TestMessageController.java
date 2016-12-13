import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import net.roseindia.form.AmbulanceForm;
import net.roseindia.controllers.LoginController;
import net.roseindia.controllers.MessageController;
import net.roseindia.form.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)

public class TestMessageController {

	@Mock
    private Map model;
	@Mock
	private ModelMap m;
	@Mock
	private BindingResult result;
	@Test
	public void test() {
		
		try{
			MessageController controller=new MessageController();
			AmbulanceForm ambulanceForm=new AmbulanceForm();
			ambulanceForm.setUserName("van");
			org.junit.Assert.assertEquals(controller.home(m),"messagepage");
			org.junit.Assert.assertEquals(controller.home1(ambulanceForm, m),"messagepage");
			org.junit.Assert.assertEquals(controller.ambulance(model),"DoctorToSd");
			org.junit.Assert.assertEquals(controller.DoctortoSdpost(ambulanceForm, model),"DoctorToSd");
			}
			catch(Exception e){}
	}

}
