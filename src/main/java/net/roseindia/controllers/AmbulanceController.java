package net.roseindia.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.roseindia.dao.AmbulanceDAO;
import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.form.LoginForm;
import net.roseindia.model.ShowMessage;
import net.roseindia.model.Users;
import net.roseindia.model.ambulance_msg;
import net.roseindia.service.LoginService;
import net.roseindia.service.UserService;


@Controller
public class AmbulanceController {

	
	@Autowired
	public UserService userService;

	 
	@RequestMapping(value ="Ambulance1.html", method = RequestMethod.GET)
	public String ambulance(Map<String, Object> m){
		

		
		userService.changeSdSeenStatus();
		
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	
ArrayList<AllAmbulanceMsgs> DoctorAck = userService.show_all_msg_doctor();
		ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg();
		
		m.put("ss", ss);
		m.put("DoctorAck", DoctorAck);
		
		//	for (AllAmbulanceMsgs p : DoctorAck)
			//  System.out.println("point x: " + p.getuname()+" "+p.getmsg()+" "+p.getid());
		

		return "AmbToSdMsg";
	}
	
	
	
	
	@RequestMapping(value="recent_msg.html", method = RequestMethod.GET)
	public String amb_msgs(@RequestParam String AmbulanceUser, Map<String,Object> map) {
		
		System.out.println(AmbulanceUser);
		ArrayList<AllAmbulanceMsgs> ss = userService.GetAllAmbMsgs(AmbulanceUser);
		//for (AllAmbulanceMsgs p : ss)
		  //System.out.println("point x: "+p.getmsg()+" "+p.getstatus());
			
		if(ss.isEmpty()) {
			System.out.println("empty...........");
		}
		map.put("values", ss);
		return "AllAmbulanceMsgs";
	}

	

	@RequestMapping(value="AmbulanceForm.html", method = RequestMethod.GET)
	public String roo(@RequestParam String AmbulanceUser,ModelMap m,Map<String,Object> map){
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	
		ArrayList<AllAmbulanceMsgs> ss = userService.GetAllAmbMsgs(AmbulanceUser);
		
		//for (AllAmbulanceMsgs p : ss)
		  //System.out.println("point x: "+p.getmsg()+" "+p.getstatus());
			
		if(ss.isEmpty()) {
			System.out.println("empty...........");
		}
		map.put("values", ss);

		return "ambulance";
	}
	
	@RequestMapping(value="AmbulanceForm.html", method = RequestMethod.POST)
	public String homne(@ModelAttribute AmbulanceForm ambulanceForm,BindingResult result, Map model){

	boolean ss = userService.Insert_msg(ambulanceForm.getUserName(), ambulanceForm.getmessage());
	// System.out.println(ss);
	ArrayList<AllAmbulanceMsgs> ssa = userService.GetAllAmbMsgs(ambulanceForm.getUserName());
	
	model.put("values", ssa);	
	
	
	return "ambulance";
	}
	
	
	
}
