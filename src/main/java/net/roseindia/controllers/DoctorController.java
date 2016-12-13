package net.roseindia.controllers;

import org.springframework.web.servlet.ModelAndView;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.AmbulanceForm;
import net.roseindia.service.UserService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoaderListener;
@Controller
public class DoctorController {
	@Autowired
	public UserService userService;

	
	

    @RequestMapping(value="/welcome", method = RequestMethod.POST)
    public String printWelcome(ModelMap model,@RequestParam String roomnumber, @RequestParam String name, @RequestParam String password,@RequestParam String sdate,@RequestParam String edate) {    
        // do something with name & password
    	model.addAttribute(roomnumber);
    	model.addAttribute(name);
        model.addAttribute(password);
        model.addAttribute(sdate);
        model.addAttribute(edate);
        //////////////////
        try{
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/springexamples","root","");
        String sql = "INSERT INTO room_booking (patient_name,doctor_name,start_date,end_date,RoomNo) VALUES (?,?,?,?,?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, password);

        statement.setString(3, sdate);

        statement.setString(4, edate);
        statement.setString(5, roomnumber);

            statement.execute();

            String sql1 = "UPDATE room SET status = 1 WHERE RoomNo = ?";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            statement1.setString(1, roomnumber);
            statement1.execute();

        }
        catch(Exception e) {
        	
        }
        
        //////////
        model.addAttribute("message", "Spring 3 MVC Hello World");
        return "loginsuccess";
    }
    
    
    
    
	@RequestMapping(value ="SdMessages.html", method = RequestMethod.GET)
	public String room1(Map<String, Object> m){
		
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	

		ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg_doctor();
		for (AllAmbulanceMsgs p : ss)
		   System.out.println("point xll: " + p.getuname()+" "+p.getmsg()+" "+p.getstatus());
		m.put("ss", ss);
		
		
	return "Sdtodoctor";
	}
	
	@RequestMapping(value ="SdMessages.html", method = RequestMethod.POST)
	public String room(@ModelAttribute AmbulanceForm allAmbulanceMsgs,BindingResult result, Map<String, ArrayList<AllAmbulanceMsgs>> model){
		
		userService.setMsgStatusReadDctr(allAmbulanceMsgs.getid(), allAmbulanceMsgs.getUserName());
		
		ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg_doctor();
		model.put("ss", ss);
		
		
	return "Sdtodoctor";
	}
	
	
	
	
	@RequestMapping(value ="BookAppointment.html", method = RequestMethod.GET)
	public String BookApp(Map<String, Object> m){
		
		AmbulanceForm amb = new AmbulanceForm();
		m.put("ambulanceForm", amb);
	

	//	ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg_doctor();
	//	for (AllAmbulanceMsgs p : ss)
	//	   System.out.println("point xll: " + p.getuname()+" "+p.getmsg()+" "+p.getstatus());
	//	m.put("ss", ss);
		
		
	return "BookAppointment";
	}
	
	
	@RequestMapping(value ="BookAppointment.html", method = RequestMethod.POST)
	public String BookApppost(@RequestParam String Pname,@RequestParam String Dname,@RequestParam String Adate, @RequestParam String Edate,@RequestParam String url,  Map<String, Object> m){
		
	//	AmbulanceForm amb = new AmbulanceForm();
	//	m.put("ambulanceForm", amb);
	
		
	userService.BookAppointment(Pname,Dname,Adate,Edate,url);
		

	//	ArrayList<AllAmbulanceMsgs> ss = userService.show_all_msg_doctor();
	//	for (AllAmbulanceMsgs p : ss)
	//	   System.out.println("point xll: " + p.getuname()+" "+p.getmsg()+" "+p.getstatus());
	//	m.put("ss", ss);
		
		
	return "BookAppointment";
	}
	
	
	
	

	
	
	
}