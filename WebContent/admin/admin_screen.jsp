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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 상영관 관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp;상영관 관리 <small>&nbsp;상영관을 등록, 삭제합니다. </small></h1>
		</div>
		
		<br>
		<br>
		<br>
		
	         <button type="button" class="btn btn-warning" onclick="location.href='../screen/screen_insert_form.jsp'" > 상영관 등록 </button>
	         <br>
	         <br>
	         
	<form action="post">
          <table class="table table-striped">
            <thead>
              <tr>
                <th> 상영관 관리번호 </th>
                <th> 상영관 이름 </th>
                 <th> 영화관 이름 </th>
                <th> 좌석 수 </th>
                <th> 상영관 관리 </th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from screen;";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String scNO = rs.getString("scNO");
				String sNO = rs.getString("screenNO");
				String c_name = rs.getString("c_name");
				String seatNum = rs.getString("seatNum");
		
			%>				
            <tbody>
              <tr>
                <td><%=scNO%></td>
                <td><%=sNO%></td>
                <td><%=c_name%></td>
                <td><%=seatNum%></td>
         		<td> <button type="button" class="btn btn-danger" onclick="location.href='../screen/screen_delete_form.jsp'" > 삭제하기 </button></td>
                </tr>
            </tbody>
            <% } 
            } 
		catch (SQLException se) {
            System.out.println(se.getMessage());
        } finally {
            try {
            	if(rs!=null) rs.close();
            	if(pstmt!=null) pstmt.close();
            	if(con!=null) con.close();
            } 
            catch(SQLException se) {
            	System.out.println(se.getMessage());
            }
       }
		%>
          </table>
          </form>
</body>
</html>