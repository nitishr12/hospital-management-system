package service;

import org.springframework.stereotype.Service;

import net.roseindia.model.*;

public interface LoginService{    
       public boolean checkLogin(String userName, String userPassword);
       public String checkuser(String userName, String userPassword);
       
       // for sending message to SD from ambulance
      
}