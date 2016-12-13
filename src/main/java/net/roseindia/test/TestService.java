import static org.junit.Assert.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.After;
import org.junit.Before;

import net.roseindia.dao.LoginDAO;
import net.roseindia.dao.LoginDAOImpl;
import net.roseindia.service.*;

import org.junit.Test;

public class TestService {

	private SessionFactory sessionFactory;
	private Session session = null;

	@Before

	public void before() {

		// setup the session factory

		AnnotationConfiguration configuration = new AnnotationConfiguration();
		
		configuration.addResource("applicationContext.xml");

		configuration.addAnnotatedClass(LoginDAOImpl.class);

		configuration.setProperty("hibernate.dialect",

				"org.hibernate.dialect.H2Dialect");

		//configuration.setProperty("hibernate.connection.driver_class",

		//		"org.h2.Driver");

		configuration.setProperty("hibernate.connection.url", "jdbc:h2:mem");

		configuration.setProperty("hibernate.hbm2ddl.auto", "create");


		sessionFactory = configuration.buildSessionFactory();

		session = sessionFactory.openSession();

	}
	@Test
	public void test() {
		try{
			String userName="1";
			String userPassword="s";
			LoginDAOImpl loginDAO=new LoginDAOImpl();
			LoginServiceImpl obj=new LoginServiceImpl();
			loginDAO.setSessionFactory(sessionFactory);
			obj.setLoginDAO(loginDAO);
			org.junit.Assert.assertEquals(obj.checkLogin(userName, userPassword),true);
	}
		catch(Exception e){}
	}
	
	
	@After
	public void after() {

		session.close();

		sessionFactory.close();

	}
}
