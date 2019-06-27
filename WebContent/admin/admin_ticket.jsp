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
		<title> 티켓관리 </title>
	</head>
	
	<body>
		<div class="top">
			<jsp:include page="topAdmin.jsp"></jsp:include>
		</div>
		
		<div class="page-header">
 			<h1>&nbsp;티켓 관리 <small>&nbsp;예약을 확인하고 티켓을 발권합니다. </small></h1>
		</div>
		
		<br>
		<br>
		<br>

	<form action="post">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>아이디</th>
                <th>예약번호</th>
                <th>영화</th>
                <th>상영관</th>
                <th>상영날짜</th>
                <th>상영시각</th>
                <th>예매인원</th>
                <th>지불방법(h:현장/i:인터넷)</th>
                <th>발권여부(0:미발권/1:발권)</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from re join payinfo on re.rCode=payinfo.rCode";
			//"select * from payinfo join ticket on payinfo.rCode=ticket.rCode";
			//select * from re join payinfo on re.mem_id=payinfo.mem_id where re.reserDate=payinfo.paidDate;
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("mem_id");
				String code = rs.getString("rCode");
				String m_title = rs.getString("m_title");
				String screenNO = rs.getString("screenNO");
				String showdate = rs.getString("showdate");
				String showtime= rs.getString("showtime");
				String peo= rs.getString("people");
				String meth = rs.getString("payMeth");
				String isPaid = rs.getString("isPaid");
			%>				
            <tbody>
              <tr>
                <td><%=id%></td>
                <td><%=code%></td>
                <td><%=m_title%></td>
                <td><%=screenNO%></td>
                <td><%=showdate%></td>
                <td><%=showtime%></td>
                <td><%=peo%></td>
                <td><%=meth%></td>
                <td><%=isPaid%></td>
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
        } %>
          </table>
           <button type="button" class="btn btn-info" onclick="location.href='../ticket/admintiCheck.jsp'" > 발권 </button>
          </form>
</body>
</html>