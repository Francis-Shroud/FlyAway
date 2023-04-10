package operations;
import java.sql.*;
import connection.DbConnection;
import modelGetSet.*;

public class PassRegOper {
	private Connection con;
	private PreparedStatement ps;

	public PassRegOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewPassReg(PassReg passr) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into PassengerReg(airline_code, pname, gender, age, passportno) value(?,?,?,?,?)");
			ps.setString(1, passr.getAirline_code());
			ps.setString(2, passr.getPname());
			ps.setString(3, passr.getGender());
			ps.setInt(4, passr.getAge());
			ps.setString(5, passr.getPassportno());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllPassRegDetail() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from PassengerReg");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
	
	public ResultSet ShowSelectPassRegDetail(PassReg passr) {
		ResultSet rs = null;
		try {
			/*select * from PassengerReg where airline_code="6E";*/
			ps = con.prepareStatement("select Pname from PassengerReg where airline_code = ? ");
			ps.setString(1, passr.getAirline_code());
			rs = ps.executeQuery();
		} 
		catch (Exception ex) 
		{
			rs = null;
		}
		return rs;
	}
}
