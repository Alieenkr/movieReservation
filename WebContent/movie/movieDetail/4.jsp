<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

 
<!DOCTYPE html>

<html>
	<head>
		<title> 영화상세보기 </title>
	</head>
	
	<%
	String mem_id = null;
	if(session.getAttribute("mem_id") != null) {
		mem_id = (String) session.getAttribute("mem_id");
	}
	%>
	
	<body>
	
	<% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from movie where m_id=4";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				int m_id = rs.getInt("m_id");
				String m_title = rs.getString("m_title");
				String m_direc = rs.getString("m_direc");
				String m_actor = rs.getString("m_actor");
				String m_grade = rs.getString("m_grade");
				String m_plot = rs.getString("m_plot");
             %>
	
		<br>
		<br>
		<br>
    	<table border="1">
			<tr><th> 이름 </th><td><%=m_title%></td></tr>
			<tr><th> 감독 </th><td><%=m_direc%></td></tr>
			<tr><th> 배우 </th><td><%=m_actor%></td></tr>
			<tr><th> 등급 </th><td><%=m_grade%></td></tr>
			<tr><th> 줄거리 </th><td><%=m_plot%></td></tr>
			 
		<%}
         } catch (SQLException se) {
           	System.out.println(se.getMessage());
         } finally {
            try {
            	if(rs!=null) rs.close();
           	 	if(pstmt!=null) pstmt.close();
            	if(con!=null) con.close();
            } catch(SQLException se) {
            	System.out.println(se.getMessage());
            }
        }
		%>
		
	 </table>
	 <br>
   		 <input type="button" onclick="location.href='../movie_main.jsp'" value="닫기" style="width:80px">
</body>
</html>