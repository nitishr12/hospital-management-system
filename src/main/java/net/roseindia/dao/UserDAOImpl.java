package net.roseindia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import net.roseindia.form.AllAmbulanceMsgs;
import net.roseindia.form.CountForm;
import net.roseindia.java.HibernateUtil;
import net.roseindia.model.ambulance_msg;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	

	 @Resource(name="sessionFactory")
     protected SessionFactory sessionFactory;

     public void setSessionFactory(SessionFactory sessionFactory) {
            this.sessionFactory = sessionFactory;
     }
    
     protected Session getSession(){
            return sessionFactory.openSession();
     }
     
     
	@Override
	public boolean Insert_msg(String userName, String message) {
	 	   System.out.println("in DAO page");

		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO messages" +
					" (msg_id,userName, Messages,status,seenstatus) VALUES (?,?,?,?,?) ";
			
			String sql1 = "UPDATE cronloader SET status = 1 ";
			stmt.executeUpdate(sql1);
			
			Random rand = new Random(); 
			int value = rand.nextInt(1000); 
			
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setInt(1, value);
			preparedStatement.setString(2, userName);
			preparedStatement.setString(3, message);
			preparedStatement.setInt(4, 0);
			preparedStatement.setInt(5, 0);
			preparedStatement.executeUpdate();

		    con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 

		return true;
 	   
    }

	@Override
	public ArrayList<AllAmbulanceMsgs> show_all_msg() {
		// TODO Auto-generated method stub
		
		
		
		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM messages";
			ResultSet r = stmt.executeQuery(sql);
			ArrayList<AllAmbulanceMsgs> allmsgs = new ArrayList<AllAmbulanceMsgs>();
			
			while(r.next()) {
				String userName = r.getString("userName");
				String Messages = r.getString("Messages");
				int status = r.getInt("status");
				int id = r.getInt("msg_id");
				AllAmbulanceMsgs al = new AllAmbulanceMsgs();
				al.setuname(userName);
				al.setmsg(Messages);
				al.setstatus(status);
				al.setid(id);
				
				allmsgs.add(al);

			}
		    con.close();

			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public void setMsgStatusRead(int getid,String msg) {
		// TODO Auto-generated method stub
		System.out.println("In DAO to change status"+getid);
		 Connection con;
			PreparedStatement preparedStatement = null;
			PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			String sql = "UPDATE messages SET status = ? "
					+ " WHERE msg_id = ? ";
			preparedStatement = con.prepareStatement(sql);

			preparedStatement.setInt(1, 1);
			preparedStatement.setInt(2, getid);
			preparedStatement.executeUpdate();
			
			String sql1 = "INSERT INTO sdtodoctor "
					+ "(msg_id,message,status) VALUES (?,?,?)";
			
			ps = con.prepareStatement(sql1);
			ps.setInt(1, getid);
			ps.setString(2, msg);
			ps.setInt(3, 0);
			ps.executeUpdate();
		    con.close();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> show_all_msg_doctor() {
		// TODO Auto-generated method stub
		
		
		System.out.println("In sd to doctor msgs DAO");
		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			String sql = "SELECT * FROM sdtodoctor";
			preparedStatement = con.prepareStatement(sql);
		// 	preparedStatement.setInt(1, 1);
				
			ResultSet r = preparedStatement.executeQuery(sql);
			ArrayList<AllAmbulanceMsgs> allmsgs = new ArrayList<AllAmbulanceMsgs>();
			
			while(r.next()) {
				String Messages = r.getString("message");
				String userName = r.getString("doctor_name");
				int status = r.getInt("status");
				int id = r.getInt("msg_id");
				System.out.println(status);
				AllAmbulanceMsgs al = new AllAmbulanceMsgs();
				al.setuname(userName);
				al.setmsg(Messages);
				al.setstatus(status);
				al.setid(id);
				
				allmsgs.add(al);

			}
		    con.close();

			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

	@Override
	public void setMsgStatusReadDctr(int getid, String uname) {
		// TODO Auto-generated method stub
		System.out.println("In DAO to change status for dctr"+getid);
		 Connection con;
			PreparedStatement preparedStatement = null;
			PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			String sql = "UPDATE sdtodoctor SET status = ?, doctor_name= ? "
					+ " WHERE msg_id = ? ";
			preparedStatement = con.prepareStatement(sql);

			System.out.println(uname+" "+getid);
			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, uname);
			preparedStatement.setInt(3, getid);
			preparedStatement.executeUpdate();
			
			String sql1 = "INSERT INTO emergencycases "
					+ "(doctor_name,message) VALUES (?,?)";
			
			ps = con.prepareStatement(sql1);
			ps.setString(1, uname);
			ps.setInt(2,  getid);
			ps.executeUpdate();
		    con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkEmail(String email) {
		// TODO Auto-generated method stub
		
		boolean emailpresent = false;
		System.out.println("In check EmailDAO");
		Session session = sessionFactory.openSession();
		String SQL_QUERY =" select email from Users as o WHERE o.email = ?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0, email);
		
		List list = query.list();
		

		if ((list != null) && (list.size() > 0)) {
			emailpresent= true;
		}

		session.close();

		
		return emailpresent;
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> GetAllAmbMsgs(String ambulanceUser) {
		// TODO Auto-generated method stub

		

		System.out.println("In sll amb msgs DAO");
		 Connection con = null;
			PreparedStatement preparedStatement = null;
		try {
				con = DriverManager.getConnection(
				         "jdbc:mysql://localhost:3306/springexamples",
				         "root","");
			
			String sql = "SELECT Messages,status FROM `messages` WHERE userName = ? ";
			preparedStatement = con.prepareStatement(sql);
		 	preparedStatement.setString(1, ambulanceUser);
				
			ResultSet r = preparedStatement.executeQuery();
			ArrayList<AllAmbulanceMsgs> allmsgs = new ArrayList<AllAmbulanceMsgs>();
			
			while(r.next()) {
				String Messages = r.getString("Messages");
				int status = r.getInt("status");
			//	System.out.println(Messages+" "+status);
				AllAmbulanceMsgs al = new AllAmbulanceMsgs();
				al.setmsg(Messages);
				al.setstatus(status);
				
				allmsgs.add(al);

			}
		    con.close();
			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public ArrayList<CountForm> getRoomCount() {
		// TODO Auto-generated method stub
		System.out.println("In get room count DAO");
		 Connection con = null;
			PreparedStatement preparedStatement = null;
		try {
				con = DriverManager.getConnection(
				         "jdbc:mysql://localhost:3306/springexamples",
				         "root","");
			
			String sql = "SELECT COUNT(RoomNo) as c FROM `room` WHERE status = ? AND type= ? ";
			preparedStatement = con.prepareStatement(sql);
		 	preparedStatement.setInt(1, 0);
		 	preparedStatement.setString(2, "operating");
				
			ResultSet r = preparedStatement.executeQuery();
			int count = 0;
			if(r.next())
			 count = r.getInt("c");
			r.close();
			preparedStatement.close();
			
			String sql1 = "SELECT COUNT(RoomNo) as c1 FROM `room` WHERE status = ? AND type= ? ";
			preparedStatement = con.prepareStatement(sql1);
		 	preparedStatement.setInt(1, 0);
		 	preparedStatement.setString(2, "ward");
		 	ResultSet r1 = preparedStatement.executeQuery();
			int count1=0;
			if(r1.next())
			 count1 = r1.getInt("c1");
			
			r1.close();
			preparedStatement.close();
				
			
			String sql2 = "SELECT COUNT(RoomNo) as c2 FROM `room` WHERE status = ? AND type= ? ";
			preparedStatement = con.prepareStatement(sql2);
		 	preparedStatement.setInt(1,0);
		 	preparedStatement.setString(2, "emergency");
		 	ResultSet r2 = preparedStatement.executeQuery();
		 	
			int count2=0;
			if(r2.next())
			 count2 = r2.getInt("c2");
			
			//int count2 = r2.getInt("c2");
			r2.close();
			preparedStatement.close();
				
			
			String sql3 = "SELECT COUNT(RoomNo) as c3 FROM `room` WHERE type= ? ";
			preparedStatement = con.prepareStatement(sql3);
		 	preparedStatement.setString(1, "operating");
		 	ResultSet r3 = preparedStatement.executeQuery();
		 	
			int count3=0;
			if(r3.next())
			 count3 = r3.getInt("c3");
			
			//int count3 = r3.getInt("c3");
			r3.close();
			preparedStatement.close();
			
			
			
			String sql4 = "SELECT COUNT(RoomNo) as c4 FROM `room` WHERE type= ? ";
			preparedStatement = con.prepareStatement(sql4);
		 	preparedStatement.setString(1, "ward");
		 	ResultSet r4 = preparedStatement.executeQuery();
		 	
			int count4=0;
			if(r4.next())
			 count4 = r4.getInt("c4");
			
			//int count4 = r4.getInt("c4");
			r4.close();
			preparedStatement.close();
			
			
			
			String sql5 = "SELECT COUNT(RoomNo) as c5 FROM `room` WHERE type= ? ";
			preparedStatement = con.prepareStatement(sql5);
		 	preparedStatement.setString(1, "emergency");
		 	ResultSet r5 = preparedStatement.executeQuery();
		 	
			int count5=0;
			if(r5.next())
			 count5 = r5.getInt("c5");
			
	//		int count5 = r5.getInt("c5");
			r5.close();
			preparedStatement.close();
			
			
			
			
			ArrayList<CountForm> allmsgs = new ArrayList<CountForm>();
			
				CountForm ala01 = new CountForm();
				ala01.setCount(count);
				allmsgs.add(0, ala01);
				
				System.out.println((allmsgs.get(0)).getCount());
				CountForm ala02 = new CountForm();

				ala02.setCount(count1);
				allmsgs.add(1, ala02);
				System.out.println((allmsgs.get(1)).getCount());
				
				CountForm ala03 = new CountForm();

				ala03.setCount(count2);
				allmsgs.add(2, ala03);
				
				
				CountForm ala1 = new CountForm();

				ala1.setCount(count3);
				allmsgs.add(3, ala1);
				
				CountForm ala2 = new CountForm();

				
				ala2.setCount(count4);
				allmsgs.add(4, ala2);

				CountForm ala3 = new CountForm();

				
				ala3.setCount(count5);
				allmsgs.add(5, ala3);
			
				System.out.println((allmsgs.get(2)).getCount());
				System.out.println((allmsgs.get(3)).getCount());
				System.out.println((allmsgs.get(4)).getCount());
				System.out.println((allmsgs.get(5)).getCount());
				
			
		    con.close();
			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return null;
	}

	@Override
	public void changeSdSeenStatus() {
		// TODO Auto-generated method stub
		System.out.println("In change status of seenDAO");
		Session session = sessionFactory.openSession();
		//Query using Hibernate Query Language
		String SQL_QUERY =" update ambulance_msg set seenstatus = ?";
		Query query = session.createQuery(SQL_QUERY);
		query.setParameter(0,1);
		query.executeUpdate();

		session.close();
		
	}

	@Override
	public void sendDtoSd(String uname, String message) {
		// TODO Auto-generated method stub
		System.out.println("in send msg to sd DAO page");

		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO doctor_msg" +
					" (doctor_name, message) VALUES (?,?) ";
						
			
			preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, uname);
			preparedStatement.setString(2, message);
			
			preparedStatement.executeUpdate();

		    con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			   
	}

	@Override
	public ArrayList<AllAmbulanceMsgs> getDoctorMessages() {
		// TODO Auto-generated method stub
		
		
		
		 Connection con;
			PreparedStatement preparedStatement = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM doctor_msg";
			ResultSet r = stmt.executeQuery(sql);
			ArrayList<AllAmbulanceMsgs> allmsgs = new ArrayList<AllAmbulanceMsgs>();
			
			while(r.next()) {
				String userName = r.getString("doctor_name");
				String Messages = r.getString("message");
				int status = r.getInt("status");
				AllAmbulanceMsgs al = new AllAmbulanceMsgs();
				al.setuname(userName);
				al.setmsg(Messages);
				al.setstatus(status);
				
				allmsgs.add(al);

			}
		    con.close();

			return allmsgs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	@Override
	public void changeSdSeenStatusdctr(String userName, String getmessage) {
		// TODO Auto-generated method stub
		System.out.println("In DAO to change status");
		 Connection con;
			PreparedStatement preparedStatement = null;
			PreparedStatement ps = null;
		try {
			con = DriverManager.getConnection(
			         "jdbc:mysql://localhost:3306/springexamples",
			         "root","");
			String sql = "UPDATE doctor_msg SET status = ? "
					+ " WHERE doctor_name = ? AND message = ? ";
			preparedStatement = con.prepareStatement(sql);

			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, userName);
			preparedStatement.setString(3, getmessage);
			preparedStatement.executeUpdate();
			
		
		    con.close();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
		
	}

	@Override
	public void BookAppointments(String pname, String dname, String adate, String edate, String url) {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
				System.out.println("in dcr booking app DAO page");

				 Connection con;
					PreparedStatement preparedStatement = null;
				try {
					con = DriverManager.getConnection(
					         "jdbc:mysql://localhost:3306/springexamples",
					         "root","");
					Statement stmt = con.createStatement();
					String sql = "INSERT INTO appiontments" +
							" (user_name, `desc`,start_date, end_date, url) VALUES (?,?,?,?,?) ";
								
					
					preparedStatement = con.prepareStatement(sql);
					preparedStatement.setString(1, dname);
					preparedStatement.setString(2, pname);
					preparedStatement.setString(3, adate);
					preparedStatement.setString(4, edate);
					preparedStatement.setString(5, url);
					
					preparedStatement.executeUpdate();

				    con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					   
				
	}
}
