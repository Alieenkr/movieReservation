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
		<title> 티켓보기 </title>
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
			String sql = "select * from re join ticket on re.rCode=ticket.rCode where re.mem_id=?";
			//select * from re inner join member on re.mem_id=member.mem_id;
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				int t_num = rs.getInt("t_num");
				String m_title = rs.getString("m_title");
				String c_name = rs.getString("c_name");
				String showdate = rs.getString("showdate");
				String screenNO = rs.getString("screenNO");
				String showtime = rs.getString("showtime");
				String reSeat = rs.getString("reSeat");
				String mem = rs.getString("mem_id");
             %>
	
		<br>
		<br>
		<br>
    	<table border="1">
			<tr><th> 티켓번호 </th><td><%=t_num%></td></tr>
			<tr><th> 영화 </th><td><%=m_title%></td></tr>
			<tr><th> 영화관 </th><td><%=c_name%></td></tr>
			<tr><th> 상영일 </th><td><%=showdate%></td></tr>
			<tr><th> 상영관 </th><td><%=screenNO%></td></tr>
			<tr><th> 상영시간 </th><td><%=showtime%></td></tr>
			<tr><th> 좌석 </th><td><%=reSeat%></td></tr>
			<br>
			<tr><%=mem%>님 즐거운 관람되십시오.</tr>
			<br>
			 <% } 
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
   		 <button name="goBack" onclick="location.href='../reserve/myreserve.jsp'"> 닫기 </button>
</body>
</html>