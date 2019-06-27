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
		<title> 영화관 수정 폼 </title>
	</head>
	
<body>
		<div class="top">
			<jsp:include page="topCinema.jsp"></jsp:include>
		</div>
		

		<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="cinema_updateAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading">영화관정보 수정</h2>
        		
        		<br>
        		<label for="inputName" class="sr-only">ID</label>
        		<input type="text" name="c_name" id="c_name" class="form-control" placeholder="영화관 이름은 변경할 수 없습니다." style="width:250px" required>
       			<br>
       			<label for="inputAddr" class="sr-only">Addr</label>
        		<input type="text" name="c_addr" id="c_addr" class="form-control" placeholder="주소" style="width:250px" required>
        		<br>
        		<label for="inputPhone" class="sr-only">Phone</label>
        		<input type="text" name="c_phone" id="c_phone" class="form-control" placeholder="전화번호" style="width:250px" required>
       			<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 수정완료 </button>
       </form>
	   </div> 
</body>
</html>