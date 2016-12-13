import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import net.roseindia.controllers.*;
import net.roseindia.form.*;
import net.roseindia.model.Users;

import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)
public class TestFitGraphController {
	@Mock
	ModelMap m;
	@Test
	public void test() {
		try{
			String userName="vandita";
			FitGraphController obj=new FitGraphController();
			org.junit.Assert.assertEquals(obj.printWelcome(m, userName),"loginsuccess");
		}
		catch(Exception e){}
	}
}
