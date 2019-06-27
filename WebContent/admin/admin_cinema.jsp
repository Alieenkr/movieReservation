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
		<title> 영화관관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp;영화관 관리 <small>&nbsp;영화관을 등록, 수정, 삭제합니다. </small></h1>
		</div>
		
		<br>
		<br>
		<br>

	         <button type="button" class="btn btn-warning" onclick="location.href='../cinema/cinema_insert_form.jsp'" > 영화관 등록 </button>
	         <br>
	         <br>
		
          <table class="table table-striped">
            <thead>
              <tr>
                <th>이름</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>상영관</th>
                <th>좌석 수</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select *, sum(seatNum), count(screenNO) from cinema join screen on cinema.c_name=screen.c_name group by cinema.c_name";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String c_name = rs.getString("c_name");
				String c_addr = rs.getString("c_addr");
				String c_phone = rs.getString("c_Phone");
				int c_tSeat = rs.getInt("sum(seatNum)");
				int c_tScreen  = rs.getInt("count(screenNO)");
			%>				
            <tbody>
              <tr>
                <td><%=c_name%></td>
                <td><%=c_addr%></td>
                <td><%=c_phone%></td>
                <td><%=c_tScreen%></td>
                <td><%=c_tSeat%></td>
            <% } 
            } 
			catch (SQLException se) {
            	System.out.println(se.getMessage());
            } 
			finally {
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
           	<button type="button" class="btn btn-info" onclick="location.href='../cinema/cinema_update.jsp'" > 수정하기  </button>
          	<button type="button" class="btn btn-danger" onclick="location.href='../cinema/cinema_delete_form.jsp'" > 삭제하기 </button>

</body>
</html>