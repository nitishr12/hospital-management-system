package net.roseindia.controllers;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.java.fit;

@Controller
public class FitGraphController {

	@RequestMapping("graph.html")
    public String printWelcome(ModelMap model,@RequestParam String userName) {    
        // do something with name & password
    	
		
		//System.out.println(userName);
      		fit obj=new fit();
		obj.call(userName);
	return "loginsuccess";
	}
	
	
}
