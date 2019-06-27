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
		<title> 회원관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp;고객 관리 <small>&nbsp;VIP 고객을 관리합니다. </small></h1>
		</div>
		
		<br>
		<br>
		<br>
		
	         <button type="button" class="btn btn-warning" onclick="location.href='vipmember.jsp'" > VIP 조회 </button>
	         
		<form action="post">
          	<table class="table table-striped">
            	<thead>
              	<tr>
                	<th>아이디</th>
                	<th>이름</th>
                	<th>포인트</th>
              	</tr>
            	</thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select mem_id, mem_name, mem_point from member";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("mem_id");
				String name = rs.getString("mem_name");
				String point = rs.getString("mem_point");
			%>				
            	<tbody>
              	<tr>
                	<td><%=id%></td>
                	<td><%=name%></td>
                	<td><%=point%></td>
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
         }%>
          </table>
          </form>

</body>
</html>