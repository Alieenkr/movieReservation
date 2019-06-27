<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
 
<%@ page import="java.util.*" %> 
<%
	String c_name=request.getParameter("c_name");	
	String screenNO=request.getParameter("screenNO");
	int count = 0;
%>
<!DOCTYPE html>

<html>
	<head>
		<title> 티켓보기 </title>
	</head>

<body>

	<input name="screenNO" type="hidden" value="<%=request.getParameter("screenNO")%>">
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	
	<% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
				con=DBConnection.getCon();
				String sql = "select screen.seatNum from screen where screen.screenNO=? and screen.c_name=?";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, screenNO);
				//pstmt.setString(2, c_name);
				pstmt.setString(1, "7");
				pstmt.setString(2, "2");
				rs=pstmt.executeQuery();
				if (rs.next()) {
					int seatNum = rs.getInt("seatNum");
						for(int i = 0; i < seatNum; i++){%>
						<span><%=i%> </span>
						<%
							for(int j = 0; j < 11; j++){%>
							<span><%=j%> </span>
							<%
								++count;
								if(count>=seatNum) break;
							}%>
							<br>
							<%
							if(count>=seatNum) break;
						}
				} 
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
		
</body>
</html>