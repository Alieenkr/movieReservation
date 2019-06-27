<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
 
<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> VIP 관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1> VIP 조회 <small> 구매실적 상위 10명 </small></h1>
		</div>
		
		<br>
		<br>
		<br>

		<form action="post">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>구매 실적</th>
          		<th>전화번호</th>
	            <th>주소</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select re.mem_id, sum(re.people), member.* from re, member group by re.mem_id limit 10";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("re.mem_id");
				String name = rs.getString("member.mem_name");
				String time = rs.getString("sum(re.people)");
				String num = rs.getString("member.mem_phone");
				String addr = rs.getString("member.mem_addr");
			%>				
            <tbody>
              <tr>
                <td><%=id%></td>
                <td><%=name%></td>
                <td><%=time%></td>
                <td><%=num%></td>
                <td><%=addr%></td>
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