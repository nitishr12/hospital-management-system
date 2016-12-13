import static org.junit.Assert.*;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.*;
import org.junit.Test;

import junit.framework.TestCase;
import net.roseindia.dao.LoginDAOImpl;

public class TestLogin_2 extends TestCase {

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
		LoginDAOImpl obj=new LoginDAOImpl();
		obj.setSessionFactory(sessionFactory);
		org.junit.Assert.assertEquals(obj.checkLogin("1", "s"),true);
	}
		catch(Exception e){}
	}
	
	
	@After
	public void after() {

		session.close();

		sessionFactory.close();

	}
}
