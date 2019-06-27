<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>


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
  	
    	<title> 예매내역 삭제 </title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topReserve.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="reserdeleteAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 예매 내역 삭제 </h2>
        		<br>
        		예약번호를 다시 한 번 입력해주세요.
        		<br>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="rCode" id="id" class="form-control" placeholder="ID" style="width:200px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px" > 예약 취소 </button>
       </form>
	   </div> <!-- /container -->
	   
	      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>

  </body>
</html>