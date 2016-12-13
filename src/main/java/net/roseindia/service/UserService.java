package net.roseindia.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.CountForm;
import net.roseindia.model.*;

public interface UserService{    
   	public boolean Insert_msg(String userName,String message);

	public ArrayList<AllAmbulanceMsgs> show_all_msg();

	public void setMsgStatusRead(int getid, String getmsg);
	public void setMsgStatusReadDctr(int getid, String getmsg);

	public ArrayList<AllAmbulanceMsgs> show_all_msg_doctor();

	public boolean checkEmail(String email);

	public ArrayList<AllAmbulanceMsgs> GetAllAmbMsgs(String ambulanceUser);

	public ArrayList getRoomCount();

	public void changeSdSeenStatus();

	public void sendDtoSd(String uname, String message);

	public ArrayList<AllAmbulanceMsgs> getDoctorMessages();

	public void changeSdSeenStatusdctr(String userName, String getmessage);

	public void BookAppointment(String pname, String dname, String adate, String edate, String url);


}