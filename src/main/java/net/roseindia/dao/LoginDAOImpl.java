package net.roseindia.dao;
import net.roseindia.model.*;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO{
     
			 
       @Resource(name="sessionFactory")
       protected SessionFactory sessionFactory;

       public void setSessionFactory(SessionFactory sessionFactory) {
              this.sessionFactory = sessionFactory;
       }
      
       protected Session getSession(){
              return sessionFactory.openSession();
       }

       public boolean checkLogin(String userName, String userPassword){
			System.out.println("In Check login");
			Session session = sessionFactory.openSession();
			boolean userFound = false;
			//Query using Hibernate Query Language
			String SQL_QUERY =" from Users as o where o.userName=? and o.userPassword=?";
			Query query = session.createQuery(SQL_QUERY);
			query.setParameter(0,userName);
			query.setParameter(1,userPassword);
			List list = query.list();

			if ((list != null) && (list.size() > 0)) {
				userFound= true;
			}

			session.close();
			return userFound;              
       }
       
       public String checkuser(String userName, String userPassword) {
    	   String useramb = null;
			Session session = sessionFactory.openSession();
			String SQL_QUERY ="SELECT o.userrole from Users AS o WHERE o.userName=? and o.userPassword =?";
			Query query = session.createQuery(SQL_QUERY);
			query.setParameter(0,userName);	
			query.setParameter(1,userPassword);
			
			List results = query.list();
			
			if ((results != null) && (results.size() > 0)) {
				if(results.toString().matches(".*\\bambulance\\b.*")) {
					useramb= "ambulance";
				}else if(results.toString().matches(".*\\bsd\\b.*")) {
					useramb= "sd";
				}else {
					useramb = "doctor";
				}
			}
			session.close();
		return useramb;
    	   
       }
       
       
}