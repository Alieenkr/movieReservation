package msystem;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getCon() throws SQLException {
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
			String dbId = "root";
			String dbPass = "rootroot";
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
			return con;
		}
		catch (ClassNotFoundException ce) {
			System.out.println(ce.getMessage());
			return null;
		}
	}

}
