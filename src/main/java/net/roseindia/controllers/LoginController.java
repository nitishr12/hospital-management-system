package net.roseindia.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;

import org.springframework.beans.factory.annotation.Autowired;


import java.util.Map;
import javax.validation.Valid;

import net.roseindia.form.AmbulanceForm;
import net.roseindia.form.LoginForm;
import net.roseindia.service.*;

@Controller
@RequestMapping("loginform.html")
public class LoginController {


	@Autowired
	public LoginService loginService;

	@RequestMapping(method = RequestMethod.GET)
	public String showForm(Map model) {
		LoginForm loginForm = new LoginForm();
		model.put("loginForm", loginForm);
		return "loginform";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processForm(@Valid LoginForm loginForm, BindingResult result,
			Map model, ModelMap model1) {
		if (result.hasErrors()) {
			System.out.println("has error");
			return "loginform";
		}
		boolean userExists = loginService.checkLogin(loginForm.getUserName(),loginForm.getPassword());
		String userrole = loginService.checkuser(loginForm.getUserName(), loginForm.getPassword());


		
		if(userrole == "ambulance"){
			System.out.println("ambulacne");
			AmbulanceForm ambulanceForm = new AmbulanceForm();
			String aa = loginForm.getUserName();
			model1.addAttribute("aaa", aa);


			model.put("ambulanceForm", ambulanceForm);
			
			return "authenticateAmb";
		}else if(userExists){
			System.out.println("user exists");
			String aa = loginForm.getUserName();
			model.put("loginForm", loginForm);
			model1.addAttribute("aaa", aa);
			model1.addAttribute("role", userrole);
			
			return "authenticate";
			
		}else{
			System.out.println("user not exixts");
			result.rejectValue("userName","invaliduser");
			return "loginform";		}
			
		}
	}

