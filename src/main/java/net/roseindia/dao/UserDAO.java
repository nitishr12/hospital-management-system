package net.roseindia.dao;
import java.util.ArrayList;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.CountForm;
/*
@Author: Deepak Kumar
Check more tutorials at http://www.roseindia.net
*/
import net.roseindia.model.*;

public interface UserDAO{    
   	public boolean Insert_msg(String userName,String message);

	public ArrayList<AllAmbulanceMsgs> show_all_msg();

	public ArrayList<AllAmbulanceMsgs> show_all_msg_doctor();
	
	public void setMsgStatusRead(int getid, String getmsg);
	public void setMsgStatusReadDctr(int getid, String getmsg);

	public boolean checkEmail(String email);

	public ArrayList<AllAmbulanceMsgs> GetAllAmbMsgs(String ambulanceUser);

	public ArrayList<CountForm> getRoomCount();

	public void changeSdSeenStatus();

	public void sendDtoSd(String uname, String message);

	public ArrayList<AllAmbulanceMsgs> getDoctorMessages();

	public void changeSdSeenStatusdctr(String userName, String getmessage);

	public void BookAppointments(String pname, String dname, String adate, String edate, String url);

}