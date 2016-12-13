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
import net.roseindia.controllers.ServiceDeskController;
import net.roseindia.form.*;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import java.util.Map;

import static org.mockito.Mockito.verifyZeroInteractions;

@RunWith(MockitoJUnitRunner.class)
public class TestServiceDeskController {

	@Test
	public void test() {
		ServiceDeskController controller=new ServiceDeskController();
		org.junit.Assert.assertEquals(controller.r(),"SdCronLoader");
	}

}
