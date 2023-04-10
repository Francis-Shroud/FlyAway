package operations;

import connection.DbConnection;
import modelGetSet.*;
import java.sql.*;

public class AdminAirportOper {
	private Connection con;
	private PreparedStatement ps;

	public AdminAirportOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewAirport(AdminAirport stairport) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into airports(a_code, a_name, city, country) value(?,?,?,?)");
			ps.setString(1, stairport.getPortCode());
			ps.setString(2, stairport.getPortName());
			ps.setString(3, stairport.getPortCity());
			ps.setString(4, stairport.getPortCountry());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllAirport() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from airports");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
	
	public String DeleteAirport(String a_code)
	{
		String chk = "Err";
		try 
		{
		ps = con.prepareStatement("delete from airports where a_code =?");
		ps.setString(1, a_code);
		int res = ps.executeUpdate();
		
			if(res>=1)
			{
				chk = "Success";	
			}
	
		}
		catch(Exception ex)
		{
			System.out.println(ex);
		}
		return chk;
	}	
}
