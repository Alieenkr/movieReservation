<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>

<html>
  	<head>	
    	<title> 관리자 로그인 창</title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topAdmin2.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="adminloginAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading">관리자 로그인</h2>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="mem_id" id="id" class="form-control" placeholder="ID" style="width:200px" required autofocus>
       			<br>
       			<label for="inputPassword" class="sr-only">Password</label>
        		<input type="password" name="mem_pwd" id="pwd" class="form-control" placeholder="Password" style="width:200px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px" > 로그인 </button>
       </form>
	   </div> <!-- /container -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script> 
	<script src="js/docs.min.js"></script>
  </body>
</html>
	