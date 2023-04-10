package connection;
import java.sql.*;
public class DbConnection {

	public static Connection GetConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root", "123456");
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return con;
	}

}
