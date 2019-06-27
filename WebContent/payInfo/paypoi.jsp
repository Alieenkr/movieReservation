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
		<title> 포인트관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topPay.jsp"></jsp:include>
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
                <th>결제코드</th>
                <th>예약코드</th>
                <th>예매아이디</th>
                <th>예매자 포인트</th>
                <th>사용 포인트</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select payCode, payinfo.rCode, payinfo.mem_id, mem_point, paidpoi from member"
							+"join payinfo on member.mem_id=payinfo.mem_id where payinfo.mem_id=?";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String payCode = rs.getString("payCode");
				String payinforCode = rs.getString("payinfo.rCode");
				String mem_id = rs.getString("payinfo.mem_id");
				int mem_point = rs.getInt("mem_point");
				int paidpoi  = rs.getInt("paidpoi");
			%>				
            <tbody>
              <tr>
                <td><%=payCode%></td>
                <td><%=payinforCode%></td>
                <td><%=mem_id%></td>
                <td><%=mem_point%></td>
                <td><%=paidpoi%></td>
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
           	<button type="button" class="btn btn-info" onclick="location.href='../cinema/cinema_update2.jsp'" > 수정하기  </button>
          	<button type="button" class="btn btn-danger" onclick="location.href='../cinema/cinema_delete_form.jsp'" > 삭제하기 </button>

</body>
</html>
