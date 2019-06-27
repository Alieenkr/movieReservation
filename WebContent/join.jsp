<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>

<html>
  	<head>
    	<title> 회원가입 </title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topMember.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="joinAction.jsp" style="margin-center">
        	<h2 class="form-signin-heading">회원가입</h2>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="mem_id" id="id" class="form-control" placeholder="아이디" style="width:250px" required autofocus>
       			<br>
       			<label for="inputPassword" class="sr-only">Password</label>
        		<input type="password" name="mem_pwd" id="pwd" class="form-control" placeholder="비밀번호" style="width:250px" required>
        		<br>
        		<label for="inputName" class="sr-only">Name</label>
        		<input type="text" name="mem_name" id="name" class="form-control" placeholder="이름" style="width:250px" required>
       			<br>
       			<label for="inputBirth" class="sr-only">Birth</label>
        		<input type="text" name="mem_birth" id="birth" class="form-control" placeholder="생년월일" style="width:250px" required>
        		<br>
        		<label for="inputAddress" class="sr-only">Address</label>
        		<input type="text" name="mem_addr" id="addr" class="form-control" placeholder="주소" style="width:250px" required>
       			<br>
       			<label for="inputPHone" class="sr-only">Phone</label>
        		<input type="text" name="mem_phone" id="phone" class="form-control" placeholder="전화번호" style="width:250px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 회원가입 </button>
       </form>
	   </div> <!-- /container -->

  </body>
</html>