package net.roseindia.form;

import org.hibernate.validator.constraints.NotEmpty;

public class User {
	   private String username;
	   @NotEmpty
	   public void setUserName(String pppname){
		      this.username=pppname;
		  }
	   public String getUserName(){
		      return username;
	   }	   
	  
	   
	}
