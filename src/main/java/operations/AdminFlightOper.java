package operations;
import connection.DbConnection;
import modelGetSet.*;
import java.sql.*;

public class AdminFlightOper {
	private Connection con;
	private PreparedStatement ps;

	public AdminFlightOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewFlight(AdminFlight stflight) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into flights(F_id, airline_code, source_code, destination_code, price, seats) value(?,?,?,?,?,?)");
			ps.setInt(1, stflight.getFlightID());
			ps.setString(2, stflight.getFlightCode());
			ps.setString(3, stflight.getFlightDest());
			ps.setString(4, stflight.getFlightSource());
			ps.setInt(5, stflight.getFlightPrice());
			ps.setInt(6, stflight.getFlightSeats());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllFlights() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from flights");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
	
	public ResultSet ShowAllSelectFlight(AdminFlight stflight) {
		ResultSet rs = null;
		try {
			
			/*select BookingsPerDay.bdate, flights.airline_code, flights.source_code, flights.destination_code, flights.price, flights.seats
			from flights 
			join BookingsPerDay on flights.airline_code = BookingsPerDay.airline_code
			where (source_code="DEL" AND destination_code="NGP");*/
			
			ps = con.prepareStatement("select BookingsPerDay.bdate, flights.F_id, flights.airline_code, flights.source_code, flights.destination_code, flights.price, BookingsPerDay.noofbookings, BookingsPerDay.booked from flights join BookingsPerDay on flights.airline_code = BookingsPerDay.airline_code where (source_code=? AND destination_code=? AND bdate=?)");
			ps.setString(1, stflight.getFlightSource());
			ps.setString(2, stflight.getFlightDest());	
			ps.setString(3, stflight.getBdate());
			rs = ps.executeQuery();
			
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
	
	public String DeleteFlight(int flid)
	{
		String chk = "Err";
		try 
		{
			ps=con.prepareStatement("delete from flights where F_id=?");
			ps.setInt(1, flid);
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
