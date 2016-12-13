package net.roseindia.controllers;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.CountForm;
import net.roseindia.service.UserService;



@Controller
public class NavigationController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("home.html")
	public String home(Map map, ModelMap m){
		
		
		ArrayList<CountForm> ss = userService.getRoomCount();
		
		m.addAttribute("opbooked", ss.get(0).getCount());
		m.addAttribute("wardbooked", ss.get(1).getCount());
		m.addAttribute("embooked", ss.get(2).getCount());
		m.addAttribute("op", ss.get(3).getCount());
		m.addAttribute("ward", ss.get(4).getCount());
		m.addAttribute("em", ss.get(5).getCount());
		
		
	return "home";
	}
	
	@RequestMapping(value="room_booking.html", method=RequestMethod.POST)
	public String room(){
	return "loginsuccess";
	}
	@RequestMapping(value="room_booking.html", method=RequestMethod.GET)
	public String room1(){
	return "loginsuccess";
	}

	@RequestMapping(value="Msg_nav.html")
	public String roo(){
	return "loginsuccess";
	}
	
	@RequestMapping("appointments.html")
	public String homne(){
		
	//	fit obj=new fit();
	//	obj.call();
	return "calendar";
	}
	
}



