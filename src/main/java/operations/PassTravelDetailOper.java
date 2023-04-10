package operations;

import java.sql.*;
import connection.*;
import modelGetSet.*;

public class PassTravelDetailOper {
	private Connection con;
	private PreparedStatement ps;

	public PassTravelDetailOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewPassTravelDetail(PassTravelDetail PassRegTravDet) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into PassengerTravelDetails(P_id, traveldate, traveltime, airline_code, source_code, destination_code, F_id) value(?,?,?,?,?,?,?)");
			ps.setInt(1, PassRegTravDet.getP_int());
			ps.setString(2, PassRegTravDet.getTravelDate());
			ps.setString(3, PassRegTravDet.getTravelTime());
			ps.setString(4, PassRegTravDet.getAirline_Code());
			ps.setString(5, PassRegTravDet.getSource_code());
			ps.setString(6, PassRegTravDet.getDest_code());
			ps.setString(7, PassRegTravDet.getF_id());

			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllPassTravelDetail() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from PassengerTravelDetails");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}

}
