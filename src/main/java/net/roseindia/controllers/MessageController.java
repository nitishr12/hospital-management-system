package net.roseindia.controllers;
import java.util.ArrayList;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
/*
@Author: Deepak Kumar
Check more tutorials at http://www.roseindia.net
*/
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.java.*;
import net.roseindia.model.ambulance_msg;
import net.roseindia.service.LoginService;
import net.roseindia.service.UserService;



@Controller
public class MessageController {
	
	@Autowired
	public UserService userService;

	
	@RequestMapping(value= "messageForm.html", method= RequestMethod.GET)
	public String home(ModelMap m){
		System.out.println("asss");
		AmbulanceForm ambulanceForm = new AmbulanceForm();
		m.put("ambulanceForm", ambulanceForm);
		m.put("messagesent", "nothing");
		return "messagepage";
	}
	
	@RequestMapping(value= "messageForm.html", method= RequestMethod.POST)
	public String home1(@ModelAttribute AmbulanceForm ambulanceForm, ModelMap m){
		
		System.out.println("in sdas");
		m.put("ambulanceForm", ambulanceForm);
		m.put("messagesent", "aa");
		m.put("message", ambulanceForm.getmessage());
		userService.sendDtoSd(ambulanceForm.getUserName(),ambulanceForm.getmessage());
		return "messagepage";
	}

	@RequestMapping(value ="DoctorMessages.html", method = RequestMethod.GET)
	public String ambulance(Map<String, Object> m){
		

		
		//userService.changeSdSeenStatus();
		
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	
//ArrayList<AllAmbulanceMsgs> DoctorAck = userService.getDoctorMessages();
		ArrayList<AllAmbulanceMsgs> ss = userService.getDoctorMessages();
		
		m.put("ss", ss);
//		m.put("DoctorAck", DoctorAck);
		
		//	for (AllAmbulanceMsgs p : DoctorAck)
			//  System.out.println("point x: " + p.getuname()+" "+p.getmsg()+" "+p.getid());
		

		return "DoctorToSd";
	}
	
	@RequestMapping(value ="DoctorMessages.html", method = RequestMethod.POST)
	public String DoctortoSdpost(@ModelAttribute AmbulanceForm ambulanceForm, Map<String, Object> m){
		

		
		userService.changeSdSeenStatusdctr(ambulanceForm.getUserName(),ambulanceForm.getmessage());
		
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	
//ArrayList<AllAmbulanceMsgs> DoctorAck = userService.getDoctorMessages();
		ArrayList<AllAmbulanceMsgs> ss = userService.getDoctorMessages();
		
		m.put("ss", ss);
//		m.put("DoctorAck", DoctorAck);
		
		//	for (AllAmbulanceMsgs p : DoctorAck)
			//  System.out.println("point x: " + p.getuname()+" "+p.getmsg()+" "+p.getid());
		

		return "DoctorToSd";
	}
	

}
