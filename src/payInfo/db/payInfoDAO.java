// 결제금액 확인, 포인트 사용, 지불방법선택(인/현_)

package payInfo.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import payInfo.db.payInfoBean;

public class payInfoDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static payInfoDAO instance = new payInfoDAO();
	//private static memberDAO memdao = new memDAO();
	
	public static payInfoDAO getInstance() {
		return instance;
	}
	
	private payInfoDAO(){}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";

		String dbId = "root";
		String dbPass = "rootroot";
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		return conn;
	}
	
	public int reCiInsert(payInfoBean pabean) throws Exception {
		sql = "insert into payInfo value (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Random random = new Random();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, random.nextInt(100000));
			pstmt.setString(2, pabean.getPaidmon());
			pstmt.setString(3, pabean.getPaidpoi());
			pstmt.setString(4, pabean.getPaidTot());
			pstmt.setString(5, "0");
			pstmt.setString(6, pabean.getPayMeth());
			//pstmt.setInt(7, pabean.getrCode());
			pstmt.setString(7, pabean.getPaidDate());
			pstmt.setString(8, pabean.getMem_id());
			pstmt.setString(9, pabean.getrCode());
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
	
	public int updatepoint(String mem_id, String lastpo) throws SQLException{
		sql = "update member set mem_point=? where mem_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, lastpo);
			pstmt.setString(2, mem_id);
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
