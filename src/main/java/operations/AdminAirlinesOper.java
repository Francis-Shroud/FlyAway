package operations;

import connection.DbConnection;
import modelGetSet.*;
import java.sql.*;

public class AdminAirlinesOper {
	private Connection con;
	private PreparedStatement ps;

	public AdminAirlinesOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewAirlines(Adminairlines stairlines) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into airlines(code, name) value(?,?)");
			ps.setString(1, stairlines.getAirCode());
			ps.setString(2, stairlines.getAirName());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} 
		catch (Exception ex) 
		{
			System.out.println(ex);
		}
		return chk;
	}

	public ResultSet ShowAllAirlines() {
		ResultSet rs = null;
		try 
		{
			ps = con.prepareStatement("select * from airlines");
			rs = ps.executeQuery();
		} 
		
		catch (Exception ex) 
		{
			rs = null;
		}
		return rs;
	}
	
	public String DeleteAirline(String code)
	{
		String chk = "Err";
		try 
		{
			ps=con.prepareStatement("delete from airlines where code=?");
			ps.setString(1, code);
			int res = ps.executeUpdate();
			
			if (res>=1)
			{
				chk="Success";
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return chk;
	}
}
