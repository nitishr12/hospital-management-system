import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.junit.Test;

import junit.framework.TestCase;

public class TestRooms extends TestCase {

	@Test
	public void test() {
		ResultSet rs=null;
		try{
	        Connection connection = null;
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/springexamples","root","root");
	        String sql = "SELECT status from room where RoomNo=?";
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, "201");
	        rs=statement.executeQuery();
	        rs.next();
	        org.junit.Assert.assertEquals(0,rs.getInt(1));
	        }
		catch(Exception e){}
	}

}
