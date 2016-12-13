import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import net.roseindia.controllers.LoginController;
import net.roseindia.controllers.NavigationController;
import net.roseindia.form.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)
public class TestNavigationController {

	@Mock
	private Map model;
	@Mock
	private BindingResult result;
	@Mock
	private ModelMap m;
	@Test
	public void test() {
		try{
			NavigationController obj=new NavigationController();
			org.junit.Assert.assertEquals(obj.home(model, m),"home");
			org.junit.Assert.assertEquals(obj.room(),"loginsuccess");
			org.junit.Assert.assertEquals(obj.room1(),"loginsuccess");
			org.junit.Assert.assertEquals(obj.roo(),"loginsuccess");
			org.junit.Assert.assertEquals(obj.homne(),"calendar");
		}
		catch(Exception e){}
	}

}
