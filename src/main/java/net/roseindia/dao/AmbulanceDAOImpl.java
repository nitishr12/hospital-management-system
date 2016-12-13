package net.roseindia.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import net.roseindia.model.ShowMessage;

@Repository("ambulanceDAO")
public class AmbulanceDAOImpl implements AmbulanceDAO{

	 
    @Resource(name="sessionFactory")
    protected SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
           this.sessionFactory = sessionFactory;
    }
   
    protected Session getSession(){
           return sessionFactory.openSession();
    }

	@Override
	public void save(ShowMessage sm) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.openSession();	
		Transaction tx = session.beginTransaction();
		session.persist(sm);
		tx.commit();
		session.close();
		
	}
    
}
