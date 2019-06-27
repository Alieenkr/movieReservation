<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>

<html>
	<head>
		<title> 영화관 추가 폼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>

<body>
		<div class="top">
			<jsp:include page="topCinema.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="cinema_insert.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 영화관 추가 </h2>
        		<br>
        		<label for="inputId" class="sr-only">Name</label>
        		<input type="text" name="c_name" id="name" class="form-control" placeholder="이름" style="width:250px" required autofocus>
       			<br>
       			<label for="inputPassword" class="sr-only">Addr</label>
        		<input type="text" name="c_addr" id="addr" class="form-control" placeholder="주소" style="width:250px" required>
        		<br>
        		<label for="inputName" class="sr-only">Phone</label>
        		<input type="text" name="c_phone" id="phone" class="form-control" placeholder="전화번호" style="width:250px" required>
       			<br>
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:250px" > 추가하기  </button>
       </form>
	   </div>
</body>
</html>