package operations;

import java.sql.*;
import connection.*;
import modelGetSet.*;

public class PassPaymentOper {
	private Connection con;
	private PreparedStatement ps;

	public PassPaymentOper() {
		con = DbConnection.GetConnection();
	}

	public String AddNewPassPayment(PassPayment paspmt) {
		String chk = "Err";
		try {
			ps = con.prepareStatement("insert into Payments(P_id, Amount, TransactionType, TransDate) values (?,?,?,?)");
			ps.setInt(1, paspmt.getP_id());
			ps.setFloat(2, paspmt.getAmt());
			ps.setString(3, paspmt.getTranType());
			ps.setString(4, paspmt.getTranDate());
			int res = ps.executeUpdate();

			if (res >= 1)
				chk = "Success";

		} catch (Exception ex) {
			chk = ex.getMessage();
		}
		return chk;
	}

	public ResultSet ShowAllPayments() {
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from Payments");
			rs = ps.executeQuery();
		} catch (Exception ex) {
			rs = null;
		}
		return rs;
	}
}
