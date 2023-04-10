package operations;

import java.sql.*;
import connection.*;
import modelGetSet.*;

public class PassBookingOper {

	private Connection con;
	private PreparedStatement ps;

	public PassBookingOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewPassBooking(PassBooking PaBook) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into BookingsPerDay(airline_code, bdate, noofbookings) value(?,?,?)");
			ps.setString(1, PaBook.getAirlineCode());
			ps.setString(2, PaBook.getBdate());
			ps.setInt(3, PaBook.getNoBooking());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}
	
	public ResultSet ShowEveryPassBooking() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from BookingsPerDay");
			rs = ps.executeQuery();
			} 
		catch (Exception ex) 
		{
			rs = null;
		}
		return rs;
	}

	public ResultSet ShowAllPassBooking(PassBooking par) {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from BookingsPerDay where (airline_code=? AND bdate=?)");
			ps.setString(1, par.getAirlineCode());
			ps.setString(2, par.getBdate());
			rs = ps.executeQuery();
			} 
		catch (Exception ex) 
		{
			rs = null;
		}
		return rs;
	}
	
	public String UpdateSeat(PassBooking upseat)
	{
		String chk= "Err";
		try
		{
			ps=con.prepareStatement("UPDATE BookingsPerDay SET booked = ?, noofbookings = noofbookings - ? WHERE airline_code = ? AND bdate = ?");
			ps.setInt(1, upseat.getBooked());
			ps.setInt(2, upseat.getBookedseat());
			ps.setString(3, upseat.getAirlineCode());
			ps.setString(4, upseat.getBdate());
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
	
	public String UpdateBooked(PassBooking upseat)
	{
		String chk= "Err";
		try
		{
			ps=con.prepareStatement("UPDATE BookingsPerDay SET booked = booked - 1 WHERE airline_code = ? AND bdate = ?");
			ps.setString(1, upseat.getAirlineCode());
			ps.setString(2, upseat.getBdate());
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
