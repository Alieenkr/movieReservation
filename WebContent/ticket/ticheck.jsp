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
			<jsp:include page="topTicket.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="ticheckAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading">회원 티켓 발권 </h2>
        		<br>
        		<% out.println(session.getAttribute("mem_id") + "님 티켓을 발권하시겠습니까? "); %>
        		<br>
        		발권을 진행하시려면 예약번호를 입력해주세요.
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