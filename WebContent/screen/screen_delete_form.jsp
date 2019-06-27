<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>


	<!DOCTYPE html>
<html>
  	<head>
    	<title> 상영관 삭제 </title>
  	</head>

 	 <body>
		<div class="top">
			<jsp:include page="topScreen.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:400px">
      	<form class="form-signin" method="post" action="screen_delete.jsp" style="margin-center">
        	<h2 class="form-signin-heading">상영관 삭제 </h2>
        		
        		삭제를 진행하시려면 해당 상영관 관리번호를 다시 한 번 입력해주세요.
        		<br>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="text" name="scNO" id="scNO" class="form-control" placeholder="상영관 관리번호" style="width:200px" required>
        		<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:200px" > 삭제 요청 </button>
       </form>
	   </div> <!-- /container -->

  </body>
</html>