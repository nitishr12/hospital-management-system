package net.roseindia.controllers;

import org.springframework.web.servlet.ModelAndView;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoaderListener;
@Controller
@RequestMapping("/freeRoom.html")
public class FreeRoomController {

    @RequestMapping(method = RequestMethod.POST)
    public String printWelcome(ModelMap model, @RequestParam String roomFree) {    
        // do something with name & password
        
    	
    	model.addAttribute(roomFree);
        //////////////////
        try{
        Connection connection = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/springexamples","root","");
        String sql = "DELETE FROM room_booking WHERE RoomNo = ?" ;
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, roomFree);
            statement.execute();
            String sql1 = "UPDATE room SET status = 0 WHERE RoomNo = ?";
            PreparedStatement statement1 = connection.prepareStatement(sql1);
            statement1.setString(1, roomFree);
            statement1.execute();
            
        }
        catch(Exception e) {
        	
        }
        
        //////////
        model.addAttribute("message", "Spring 3 MVC Hello World");
        return "loginsuccess";
    }
}