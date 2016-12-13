package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.roseindia.dao.LoginDAO;
import net.roseindia.dao.UserDAO;
import net.roseindia.form.AllAmbulanceMsgs;

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


}
