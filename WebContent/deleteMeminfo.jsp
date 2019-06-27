<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>


	<!DOCTYPE html>
<html>
  	<head>
    	<title> 회원탈퇴 </title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topMember.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="deleteAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading">회원 탈퇴 </h2>
        		<br>
        		<% out.println(session.getAttribute("mem_id") + "님 회원탈퇴 하시겠습니까? "); %>
        		<br>
        		탈퇴를 진행하시려면 아이디를 다시 한 번 입력해주세요.
        		<br>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="mem_id" id="id" class="form-control" placeholder="ID" style="width:200px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px" > 회원 탈퇴 </button>
       </form>
	   </div> <!-- /container -->

  </body>
</html>