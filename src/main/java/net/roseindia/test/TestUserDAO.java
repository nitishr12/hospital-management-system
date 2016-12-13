import static org.junit.Assert.*;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.junit.*;
import org.junit.Test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import junit.framework.TestCase;
import net.roseindia.dao.UserDAOImpl;

public class TestUserDAO extends TestCase {


	@Test
	public void test() {
		String userName="van";
		String message="Heart Patient emergency";
		try {
			Connection connection = null;
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/testspringexamples","root","root");
			String sql = "INSERT INTO messages" +
					" (userName, Messages) VALUES (?,?) ";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, message);
			preparedStatement.execute();
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}

			try{
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/testspringexamples","root","");
				String sql = "SELECT userName from messages where Messages=?";
				PreparedStatement statement = connection.prepareStatement(sql);
				statement.setString(1,message);
			//	statement.setString(0, "201");
				ResultSet rs=statement.executeQuery();
				rs.next();
				org.junit.Assert.assertEquals(userName,rs.getInt(1));

				}
	catch(Exception e){}

}


}
