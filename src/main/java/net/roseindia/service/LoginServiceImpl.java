package net.roseindia.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.roseindia.dao.*;


@Service("loginService")
public class LoginServiceImpl implements LoginService {

	 @Autowired
	 private LoginDAO loginDAO;

	   public void setLoginDAO(LoginDAO loginDAO) {
              this.loginDAO = loginDAO;
       }
      
       public boolean checkLogin(String userName, String userPassword){
              System.out.println("In Service class...Check Login");
              return loginDAO.checkLogin(userName, userPassword);
       }
       
       public String checkuser(String userName, String userPassword) {
   		return loginDAO.checkuser(userName, userPassword);	   
          }
       
}