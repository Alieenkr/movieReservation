// 좌석 점유 정보 등록, 좌석 점유 정보 확인

package seat.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import re.db.reBean;
import seat.db.seatBean;

public class seatDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static seatDAO instance = new seatDAO();
	
	public static seatDAO getInstance() {
		return instance;
	}
	
	private seatDAO() {}
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		return conn;
	}
	
	public int insertSeat(seatBean sebean) throws Exception {
		sql = "insert into seat value (?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sebean.getC_name());
			pstmt.setString(2,sebean.getScreenNO());
			pstmt.setInt(3, sebean.getSeatNO());
			pstmt.setInt(4, sebean.getIsSold());
			pstmt.setInt(5, sebean.getShow_num());
			pstmt.setString(6, sebean.getShowdate());
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
	
	public int createSeat(seatBean sebean, reBean rebean, String str, String randomStr) throws Exception{
		
		sql = "insert into seat (c_name, screenNO, showdate, seatNO, show_num, rCode) values (?, ?, ?, ?, "
				+ " (select show_num from showinfo where c_name=? and screenNO=? and showTime=? and m_title=?), ?)";
			
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sebean.getC_name());
				pstmt.setString(2, sebean.getScreenNO());
				pstmt.setString(3, sebean.getShowdate());
				pstmt.setString(4, str);
				pstmt.setString(5, rebean.getC_name());
				pstmt.setString(6, rebean.getScreenNO());
				pstmt.setString(7, rebean.getShowtime());
				pstmt.setString(8, rebean.getM_title());
				pstmt.setString(9, randomStr);
				return pstmt.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				if(pstmt != null) try {pstmt.close();}catch(SQLException sqle) {}
				if(conn != null) try {conn.close();}catch(SQLException sqle) {}	
			}
			return -2;
	}
	
	
/*
	public int updateMovie(movieBean moviebean) throws SQLException{
		String sql="update MOVIE set m_title=?, m_direc=?, m_actor=?, m_grade=?, m_plot=?"
				+ "where m_id=?";
	
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, moviebean.getM_title());
			pstmt.setString(2, moviebean.getM_direc());
	   		pstmt.setString(3, moviebean.getM_actor());
	   		pstmt.setInt(4, moviebean.getM_grade());
	   		pstmt.setString(5, moviebean.getM_plot());
	   		pstmt.setInt(6, moviebean.getM_id());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){ pstmt.close();}
		}
		return -1;
	}
	
	public boolean deleteMovie(String id){
		sql="DELETE FROM movie WHERE m_id=?";
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
			System.out.println("deleteMovie 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		
		return false;
	}	
/*/
}
