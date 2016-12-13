import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import net.roseindia.controllers.LoginController;
import net.roseindia.form.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)
public class TestLoginController {
	@Mock
    private Map model;
	@Mock
	private BindingResult result;
	@Mock
	private ModelMap m;
	@Test
	public void test() {
		try{
		LoginController controller=new LoginController();
		LoginForm loginForm=new LoginForm();
		loginForm.setUserName("1");
		loginForm.setPassword("s");
		org.junit.Assert.assertEquals(controller.showForm(model),"loginform");
		org.junit.Assert.assertEquals(controller.processForm(loginForm, result, model,m),"authenticate");
		}
		catch(Exception e){}
	}
}
