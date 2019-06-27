// 영화 등록, 수정, 삭제

package movie.db;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import movie.db.movieBean;

public class movieDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static movieDAO instance = new movieDAO();
	
	public static movieDAO getInstance() {
		return instance;
	}
	
	private movieDAO() {}
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		return conn;
	}
	
	public int insertMovie(movieBean moviebean) throws Exception {
		sql = "insert into MOVIE value (?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, moviebean.getM_id());
			pstmt.setString(2, moviebean.getM_title());
			pstmt.setString(3, moviebean.getM_direc());
			pstmt.setString(4, moviebean.getM_actor());
			pstmt.setInt(5, moviebean.getM_grade());
			pstmt.setString(6, moviebean.getM_plot());
		//	pstmt.setString(7, moviebean.getM_image());
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

	
	public movieBean getMovie(String id) throws SQLException{
		movieBean mb=null;
		String sql=null;
				
		try{
			sql="select * from MOVIE where m_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				mb=new movieBean();
				
				mb.setM_id(rs.getInt("m_id"));
				mb.setM_title(rs.getString("m_title"));
				mb.setM_direc(rs.getString("m_direc"));;
				mb.setM_actor(rs.getString("m_actor"));
				mb.setM_grade(rs.getInt("m_grade"));
				mb.setM_plot(rs.getString("m_plot"));
			//	mb.setM_image(rs.getString("m_image"));
				return mb;
			}
						
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){ pstmt.close(); }
			if(rs != null){ rs.close(); }	
		}	
		return null;
	}
	
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
	

}
