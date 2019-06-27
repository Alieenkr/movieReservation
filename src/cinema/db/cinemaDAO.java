// 영화관 등록, 수정, 삭제

package cinema.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cinema.db.cinemaBean;

public class cinemaDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static cinemaDAO instance = new cinemaDAO();
	
	public static cinemaDAO getInstance() {
		return instance;
	}
	
	private cinemaDAO() {}
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		return conn;
	}

	
	public int insertCinema(cinemaBean cinebean) throws Exception {
		sql = "insert into CINEMA value (?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cinebean.getC_name());
			pstmt.setString(2, cinebean.getC_addr());
			pstmt.setString(3, cinebean.getC_phone());
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
	
	public int updateCine(cinemaBean cinebean) throws SQLException{
		String sql="update CINEMA set c_addr=?, c_phone=?"
				+ "where c_name=?";
	
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cinebean.getC_addr());
			pstmt.setString(2, cinebean.getC_phone());
	   		pstmt.setString(3, cinebean.getC_name());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){ pstmt.close();}
		}
		return -1;
	}
	
	public boolean deleteCine(String id){
		sql="DELETE FROM cinema WHERE c_name=?";
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
			System.out.println("deleteCine 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}	
		return false;
	}
	
	public boolean deleteScreen(String id){
		sql="DELETE FROM screen WHERE c_name=?";
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
			System.out.println("deleteScreen 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return false;
	}
		

}
