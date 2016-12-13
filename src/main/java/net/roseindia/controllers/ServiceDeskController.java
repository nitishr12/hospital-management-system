package net.roseindia.controllers;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.service.UserService;


@Controller
public class ServiceDeskController {

	@Autowired
	public UserService userService;

	
	@RequestMapping(value="Ambulance1.html", method=RequestMethod.POST)
	public String room1(@ModelAttribute AmbulanceForm allAmbulanceMsgs,BindingResult result, Map<String, ArrayList<AllAmbulanceMsgs>> model){
		userService.setMsgStatusRead(allAmbulanceMsgs.getid(), allAmbulanceMsgs.getmessage());
		
		
		
		ArrayList<AllAmbulanceMsgs> DoctorAck = userService.show_all_msg_doctor();
		ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg();
		model.put("DoctorAck", DoctorAck);
		//	for (AllAmbulanceMsgs p : ss)
			//    System.out.println("point x: " + p.getuname()+" "+p.getmsg()+" "+p.getid());
			model.put("ss", ss);
			
return "AmbToSdMsg";
	}
	
	
	@RequestMapping(value="SdCronLoader.html")
	public String r() {		
return "SdCronLoader";
	}
	
	
}



