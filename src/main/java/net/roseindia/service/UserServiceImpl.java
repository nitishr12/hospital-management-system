package net.roseindia.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.roseindia.dao.LoginDAO;
import net.roseindia.dao.UserDAO;
import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.CountForm;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public boolean Insert_msg(String userName, String message) {
		
		
		return userDAO.Insert_msg(userName, message);
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> show_all_msg() {
		// TODO Auto-generated method stub
		return userDAO.show_all_msg();
	}

	@Override
	public void setMsgStatusRead(int getid, String getmsg) {
		// TODO Auto-generated method stub
		userDAO.setMsgStatusRead(getid, getmsg);
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> show_all_msg_doctor() {
		// TODO Auto-generated method stub
		return userDAO.show_all_msg_doctor();
	}

	@Override
	public void setMsgStatusReadDctr(int getid, String getmsg) {
		// TODO Auto-generated method stub
		userDAO.setMsgStatusReadDctr(getid, getmsg);

	}

	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		return userDAO.checkEmail(email);
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> GetAllAmbMsgs(String ambulanceUser) {
		// TODO Auto-generated method stub
		return userDAO.GetAllAmbMsgs(ambulanceUser);
	}

	@Override
	public ArrayList<CountForm> getRoomCount() {
		// TODO Auto-generated method stub
		return userDAO.getRoomCount();
	}

	@Override
	public void changeSdSeenStatus() {
		// TODO Auto-generated method stub
		userDAO.changeSdSeenStatus();
	}

	@Override
	public void sendDtoSd(String uname, String message) {
		// TODO Auto-generated method stub
		userDAO.sendDtoSd(uname,message);
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> getDoctorMessages() {
		// TODO Auto-generated method stub
		return userDAO.getDoctorMessages();
	}

	@Override
	public void changeSdSeenStatusdctr(String userName, String getmessage) {
		// TODO Auto-generated method stub
		userDAO.changeSdSeenStatusdctr(userName,getmessage);
	}

	@Override
	public void BookAppointment(String pname, String dname, String adate, String edate, String url) {
		// TODO Auto-generated method stub
		userDAO.BookAppointments(pname,dname,adate,edate,url);
	}

}
