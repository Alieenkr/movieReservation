package re.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class reDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static reDAO instance = new reDAO();
	//private static memberDAO memdao = new memDAO();
	
	public static reDAO getInstance() {
		return instance;
	}
	
	private reDAO(){}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=false";
		String dbId = "root";
		String dbPass = "rootroot";
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		return conn;
	}
	
	public int reCiInsert(reBean rebean, String randomStr) throws Exception {

		sql = "insert into re value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, randomStr);
			pstmt.setString(2, rebean.getM_title());
			pstmt.setString(3, rebean.getC_name());
			pstmt.setString(4, rebean.getShowdate());
			pstmt.setString(5, rebean.getScreenNO());
			pstmt.setString(6, rebean.getShowtime());
			pstmt.setString(7, rebean.getPeople());
			pstmt.setString(8, rebean.getReSeat());
			pstmt.setString(9, rebean.getMem_id());
			pstmt.setString(10, rebean.getReserDate());
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
	
	public boolean delete(String id){
		sql="DELETE FROM re WHERE rCode=?";
		int result=0;
		
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result=pstmt.executeUpdate();
			
			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("delete 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}	
	
	public boolean deleteseat(String id){
		sql="DELETE FROM seat WHERE rCode=?";
		int result=0;
		
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result=pstmt.executeUpdate();
			
			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("delete 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	public boolean updateseat(reBean rebean){
		sql="update seat set seat.rCode=? WHERE rCode=?";
		int result=0;
		
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, rebean.getrCode());
			pstmt.setString(2, rebean.getrCode());
			
			result=pstmt.executeUpdate();
			
			if(result!=0){
				return true;
			}
		}catch(Exception ex){
			System.out.println("rCode update 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	/*
	public int reCiInsert2(reBean rebean) throws Exception {
		sql = "insert into re value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Random random = new Random();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, random.nextInt(1000000));
			pstmt.setString(2, rebean.getM_title());
			pstmt.setString(3, rebean.getC_name());
			pstmt.setString(4, rebean.getShowdate());
			pstmt.setString(5, rebean.getScreenNO());
			pstmt.setString(6, rebean.getShowtime());
			pstmt.setString(7, rebean.getPeople());
			pstmt.setString(8, rebean.getReSeat());
			pstmt.setString(9, rebean.getMem_id());
			pstmt.setString(10, rebean.getPaidmon());
			pstmt.setString(11, rebean.getPaidpoi());
			pstmt.setString(12, rebean.getPaidTot());
			pstmt.setString(13, rebean.getPayMeth());
			pstmt.setString(14, rebean.getPaidDate());
			pstmt.setInt(15, rebean.getIsPaid());
			pstmt.setInt(16, 0);
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
	/*/
		
}
