package operations;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DbConnection;
import modelGetSet.AdminLog;

public class AdminLogOpr {
	private Connection con;
	private PreparedStatement ps;
	public AdminLogOpr()
	{
		con = DbConnection.GetConnection();
	}

	public String ChangePassword(AdminLog al)
	{
		String chk = "Err";
		try 
		{
			/*UPDATE `airline`.`Adminlogin` SET `logpass` = 'ADMIN' WHERE (`id` = '1');*/	
			ps=con.prepareStatement("update Adminlogin set logid = ? ,logpass = ? where id = 1");
			ps.setString(1, al.getLogid());
			ps.setString(2, al.getLogpass());
			int res = ps.executeUpdate();
			
			if (res>=1)
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
	
	public ResultSet ShowAdminlog()
	{
		ResultSet rs = null;
		try 
		{
		 ps = con.prepareStatement("select * from Adminlogin");
		 rs = ps.executeQuery();
		 
		}
		catch(Exception ex)
		{
			rs = null;
		}
		return rs;
	}
}
