// 상영정보 등록, 수정, 삭제

package showInfo.db;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import showInfo.db.showInfoBean;

public class showInfoDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static showInfoDAO instance = new showInfoDAO();
	
	public static showInfoDAO getInstance() {
		return instance;
	}
	
	private showInfoDAO(){}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
			
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		return conn;
	}
	
	
	public int insertInfo(showInfoBean inbean) throws Exception {
		sql = "insert into showinfo value (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inbean.getShow_num());
			pstmt.setString(2, inbean. getScreenNO());
			pstmt.setString(3, inbean.getM_title());
			pstmt.setString(4, inbean.getRunTime());
			pstmt.setString(5, inbean.getShowSDate());
			pstmt.setString(6, inbean.getShowEDate());
			pstmt.setString(7, inbean.getC_name());
			pstmt.setString(8, inbean.getShowTime());
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

	public boolean deleteInfo(String id){
		sql="DELETE FROM showinfo WHERE show_num=?";
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
			System.out.println("deleteShowInfo 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}	
		
	

}
