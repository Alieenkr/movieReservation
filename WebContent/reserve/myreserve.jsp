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
	<!-- Custom styles for this template -->
		<link rel="stylesheet" href="../css/theme.css"> 
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		 <!-- Bootstrap theme -->
		<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<title> 나의 티켓 </title>
</head>
<body>

		<div class="top">
			<jsp:include page="topReserve.jsp"></jsp:include>
		</div>
		
		<%
		String mem_id = null;
		if(session.getAttribute("mem_id") != null) {
		mem_id = (String) session.getAttribute("mem_id");
		}
		%>
		
		<div class="container">
		 <div class="col-md-6">
		 <form  method="post" >
          <table class="table table-striped">
          
            <thead>
              <tr>
                <th>예약번호</th>
                <th>영화제목</th>
                <th>상영일</th>
                <th>상영관</th>
                <th>상영시각</th>
                <th>인원</th>
                <th>지불 방법</th>
                <th>발권(0:미발권)</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select * from re join payinfo on re.rCode=payinfo.rCode where re.mem_id=?";
			//select * from re join payinfo on re.reserDate=payinfo.paidDate where re.mem_id='a';
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int rCode = rs.getInt("rCode");
				String m_title = rs.getString("m_title");
				String c_name = rs.getString("c_name");
				String showdate = rs.getString("showdate");
				String screenNO = rs.getString("screenNO");
				String showtime = rs.getString("showtime");
				String people = rs.getString("people");
				String payMeth = rs.getString("payMeth");
				String reSeat = rs.getString("reSeat");
				String payCode = rs.getString("payCode");
				String isPaid = rs.getString("isPaid");
			
			%>				
            <tbody>
              <tr>
                <td><%=rCode%></td>
                <td><%=m_title%></td>
                <td><%=showdate%></td>
                <td><%=screenNO%></td>
                <td><%=showtime%></td>
                <td><%=people%></td>
                <td><%=payMeth%></td>
                <td><%=isPaid%></td>
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
          <button type="button" class="btn btn-danger" onclick="location.href='reserveDelete.jsp'" > 예약취소 </button>
           <button type="button" class="btn btn-primary" onclick="location.href='../ticket/ticheck.jsp'" > 티켓발권 </button>
        </form>
        </div>
</div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
  </body>
</html>