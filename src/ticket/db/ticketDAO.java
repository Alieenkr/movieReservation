// 티켓 등록, 확인

package ticket.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import ticket.db.ticketBean;

public class ticketDAO {
	

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static ticketDAO instance = new ticketDAO();
	//private static memberDAO memdao = new memDAO();
	
	public static ticketDAO getInstance() {
		return instance;
	}
	
	private ticketDAO(){}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		return conn;
	}
	//티켓 생성하기
	public int reTiInsert(ticketBean tibean) throws Exception {
		sql = "insert into ticket value (?, ?)";
		Random random = new Random();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, random.nextInt(100000));
			pstmt.setString(2, tibean.getrCode());
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle) {}	
		}
		return -1;
	}
	//티켓 발권 처리하기
	public int tiIsPaid(String code) {
		sql = "update payinfo set isPaid='1' where payinfo.rCode=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle) {}	
		}
		return -1;
	}
}
