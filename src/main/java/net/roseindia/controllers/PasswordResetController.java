package net.roseindia.controllers;

import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.roseindia.form.PasswordResetFrom;
import net.roseindia.service.UserService;

@Controller
public class PasswordResetController {
	
	@Autowired
	UserService userService;

	@RequestMapping(value="passwordReset.html", method= RequestMethod.GET)
	public String resetpasswordget(Map<String,Object> m) {
		PasswordResetFrom prf = new PasswordResetFrom();
		m.put("passReset", prf);
		return "passwordReset";
	}
	@RequestMapping(value="passwordReset.html", method= RequestMethod.POST)
	public String resetpasswordpost(@Valid PasswordResetFrom prf, BindingResult result,
			Map<String, Object> model, ModelMap model1) {
		
		System.out.println(prf.getEmail());
		boolean checkEmail = userService.checkEmail(prf.getEmail());
		model.put("passReset", prf);

		if(checkEmail) 
		{
			result.rejectValue("email", "sentmail");
			System.out.println("email exists...");

		}else {
			System.out.println("email  does not exists...");
			result.rejectValue("Email", "invaliduser");
		}
		return "passwordReset";

	}
}
