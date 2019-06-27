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
		<title> 예매율 무비 차트 </title>
	</head>
	
	<body>
	
		<div class="top">
			<jsp:include page="topMovieMem.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp; 영화차트 <small> 현재 상영작의 예매율을 확인하세요. </small></h1>
		</div>
		
		<br>
		<br>
		<br>
	<form action="post">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>영화명</th>
                <th>현재 상영작 발권 티켓 수</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select m_title, sum(re.people) from re group by re.m_title order by sum(re.people) desc";
			// select c_name, sum(re.people) from re group by re.c_name;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String m_title = rs.getString("m_title");
				String sum = rs.getString("sum(re.people)");
			%>				
            <tbody>
              <tr>
                <td><%=m_title%></td>
                <td><%=sum%></td>
                </tr>
            </tbody>
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
          </form>
		
</body>
</html>