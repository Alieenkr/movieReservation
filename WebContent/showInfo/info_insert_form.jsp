<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ page import="screen.db.*" %>
<%@ page import="movie.db.*" %>
<%@ page import="cinema.db.*" %>
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 상영정보 추가 폼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="../css/theme.css"> 
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		 <!-- Bootstrap theme -->
		<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div class="top">
			<jsp:include page="topShowinfo.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="info_insertAction.jsp" style="margin-center">
      	<br>
      	<br>
        	<h2 class="form-signin-heading"> 상영정보 추가 </h2>
        		<br>
        		<label for="inputShownum" class="sr-only">showNum</label>
        		<input type="number" name="show_num" id="show_num" class="form-control" placeholder="상영정보번호" style="width:250px" required>
       			<br>
       			<select name="screenNO" size="1" style="width:250px">
 				    <option value="" selected style="font-size:30px">상영관 번호</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
       con = DBConnection.getCon();
       String sql = "SELECT screenNO FROM screen GROUP BY screenNO ORDER BY screenNO";

       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String screenNO = rs.getString("screenNO");
     %>
     <option value=<%=screenNO%>><%=screenNO%></option>
     <%
      }
      } catch (SQLException se) {
       System.out.println(se.getMessage());
      } finally {
       try {
        if (rs != null)
         rs.close();
        if (pstmt != null)
         pstmt.close();
        if (con != null)
         con.close();
       } catch (SQLException se) {
        System.out.println(se.getMessage());
       }

      }
     %>
 	</select>
		<br>
		<br>
       			<select name="m_title" size="1" style="width:250px">
 				    <option value="" selected style="font-size:30px">영화 이름</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기

      try {
       con = DBConnection.getCon();
       String sql = "SELECT m_title FROM movie GROUP BY m_title ORDER BY m_title";

       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String m_title = rs.getString("m_title");
     %>
     <option value=<%=m_title%>><%=m_title%></option>
     <%
      }
      } catch (SQLException se) {
       System.out.println(se.getMessage());
      } finally {
       try {
        if (rs != null)
         rs.close();
        if (pstmt != null)
         pstmt.close();
        if (con != null)
         con.close();
       } catch (SQLException se) {
        System.out.println(se.getMessage());
       }

      }
     %>
 	</select>
		<br>
		<br>
        		<label for="inputRunTime" class="sr-only">runTime</label>
        		<input type="text" name="rumTime" id="runTime" class="form-control" placeholder="상영시간(분)" style="width:250px" required autofocus>
       			<br>
        		<label for="inputShowSDate" class="sr-only">showSDate</label>
        		<input type="text" name="showSDate" id="showSDate" class="form-control" placeholder="상영시작일(YYYY-MM-DD)" style="width:250px" required autofocus>
       			<br>
        		<label for="inputShowEDate" class="sr-only">showEDate</label>
        		<input type="text" name="showEDate" id="showEDate" class="form-control" placeholder="상영종료일(YYYY-MM-DD)" style="width:250px" required autofocus>
       			<br>
       			<select name="c_name" size="1" style="width:250px">
 				    <option value="" selected style="font-size:30px">영화관 이름</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기

      try {
       con = DBConnection.getCon();
       String sql = "SELECT c_name FROM cinema GROUP BY c_name ORDER BY c_name";

       pstmt = con.prepareStatement(sql);
       rs = pstmt.executeQuery();
       while (rs.next()) {
        String c_name = rs.getString("c_name");
     %>
     <option value=<%=c_name%>><%=c_name%></option>
     <%
      }
      } catch (SQLException se) {
       System.out.println(se.getMessage());
      } finally {
       try {
        if (rs != null)
         rs.close();
        if (pstmt != null)
         pstmt.close();
        if (con != null)
         con.close();
       } catch (SQLException se) {
        System.out.println(se.getMessage());
       }

      }
     %>
 	</select>
 				<br>
 					<br>
        		<label for="inputShowtime" class="sr-only">showTime</label>
        		<input type="text" name="showTime" id="showTime" class="form-control" placeholder="상영시각" style="width:250px" required>
       			<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 추가하기  </button>
       </form>
	   </div> <!-- /container -->
	   
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
	

</body>
</html>