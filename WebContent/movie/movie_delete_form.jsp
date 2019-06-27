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
		<title> 영화 삭제 폼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	
<body>
		<div class="top">
			<jsp:include page="topMovie.jsp"></jsp:include>
		</div>
		
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="movie_delete.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 영화 삭제 </h2>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="number" name="m_id" id="m_id" class="form-control" placeholder="ID" style="width:300px">
       			<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 삭제하기  </button>
       </form>
	   </div> 
</body>
</html>