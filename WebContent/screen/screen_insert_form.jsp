<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="cinema.db.*" %>
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 상영관 추가 폼</title>
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
			<jsp:include page="topScreen.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="screen_insert.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 상영관 추가 </h2>
        		<br>
        		<label for="inputId" class="sr-only">scNO</label>
        		<input type="text" name="scNO" id="scNO" class="form-control" placeholder="상영관 관리번호" style="width:250px" required>
       			<br>
        		<label for="inputId" class="sr-only">screenNO</label>
        		<input type="text" name="screenNO" id="screenNO" class="form-control" placeholder="상영관 이름" style="width:250px" required autofocus>
       			<br>
       			<select name="c_name" size="1" style="width:250px">
 				    <option value="" selected style="font-size:30px">영화관 이름</option>
     <%
      // db에서 정보 얻어와 테이블에 출력하기
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
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
        		<label for="inputName" class="sr-only">seatNum</label>
        		<input type="text" name="seatNum" id="seatNum" class="form-control" placeholder="좌석 수" style="width:250px" required>
       			<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 추가하기  </button>
       </form>
	   </div> <!-- /container -->
	   
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
	

</body>
</html>