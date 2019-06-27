// 회원가입, 로그인, 회원정보 수정, 회원 삭제

package member.db;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.db.memberBean;

public class memberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private static memberDAO instance = new memberDAO();
	//private static memberDAO memdao = new memDAO();
	
	public static memberDAO getInstance() {
		return instance;
	}
	
	private memberDAO(){}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		
		String jdbcUrl = "jdbc:mysql://localhost:3306/msystem?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Asia/Seoul&useSSL=true";
		String dbId = "root";
		String dbPass = "rootroot";
			
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
			
		return conn;
	}
	
	
	public int join(memberBean membean) throws Exception {
		sql = "insert into MEMBER value (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membean.getMem_id());
			pstmt.setString(2, membean.getMem_pwd());
			pstmt.setString(3, membean.getMem_name());
			pstmt.setString(4, membean.getMem_birth());
			pstmt.setString(5, membean.getMem_addr());
			pstmt.setString(6, membean.getMem_phone());
			pstmt.setInt(7, 1000);
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

	public int login(String id, String pwd) {
		sql = "select mem_pwd from MEMBER where mem_id=?";
		
		try { 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();	
			if(rs.next()) {
				if(rs.getString(1).equals(pwd)) {
					return 1; // 로그인 성공
				}
			}
			else {
				return -1; // 아이디 없음
			}
			return 0; //비밀번호 불일치
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle) {}
			if(rs != null) try {rs.close();}catch(SQLException sqle) {}
		}
		return -2;
	}
	
	public int update(memberBean membean) throws SQLException{
		String sql="update MEMBER set mem_pwd=?, mem_name=?, mem_birth=?, "
				+ "mem_addr=?, mem_phone=? where mem_id=?";
	
		try{
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, membean.getMem_pwd());
			pstmt.setString(2, membean.getMem_name());
	   		pstmt.setString(3, membean.getMem_birth());
	   		pstmt.setString(4, membean.getMem_addr());
	   		pstmt.setString(5, membean.getMem_phone());
	   		pstmt.setString(6, membean.getMem_id());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt != null){ pstmt.close();}
		}
		return -1;
	}
	
	public boolean deleteMember(String id){
		sql="DELETE FROM member WHERE mem_id=?";
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
			System.out.println("deleteMember 에러: " + ex);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
		}
		return false;
	}	
		
	

	
}
