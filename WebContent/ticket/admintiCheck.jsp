<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>


<!DOCTYPE html>

<html>
  	<head>
    	<title> 티켓 발권 </title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topTicketAdmin.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="adminticheckAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 관리자 티켓 발권 </h2>
        		<br>
        		발권을 진행할 예약번호를 입력하세요.
        		<br>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="rCode" id="id" class="form-control" placeholder="예약번호" style="width:200px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px" > 발권 진행 </button>
       </form>
	   </div> 
  </body>
</html>