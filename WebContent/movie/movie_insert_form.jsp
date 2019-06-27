<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<html>
	<head>
		<title> 영화  추가 폼</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	</head>
	
<body>
		<div class="top">
			<jsp:include page="topMovie.jsp"></jsp:include>
		</div>
		
    	<div class="container" style="width:500px">
      	<form class="form-signin" method="post" action="movie_insert.jsp" style="margin-center">
        	<h2 class="form-signin-heading"> 영화 추가 </h2>
        		<br>
        		<label for="inputId" class="sr-only">ID</label>
        		<input type="number" name="m_id" id="id" class="form-control" placeholder="영화 아이디" style="width:300px" required autofocus>
       			<br>
       			<label for="inputTitle" class="sr-only">title</label>
        		<input type="text" name="m_title" id="title" class="form-control" placeholder="제목" style="width:300px" required>
        		<br>
        		<label for="inputDirec" class="sr-only">direc</label>
        		<input type="text" name="m_direc" id="direc" class="form-control" placeholder="영화 감독" style="width:300px" required>
       			<br>
       			<label for="inputActor" class="sr-only">actor</label>
        		<input type="text" name="m_actor" id="actor" class="form-control" placeholder="영화 출연배우" style="height:70px; width:300px;" >
        		<br>
        		<label for="inputGrade" class="sr-only">grade</label>
        		<input type="number" name="m_grade" id="grade" class="form-control" placeholder="영화 등급" style="width:300px" >
       			<br>
       			<label for="inputPlot" class="sr-only">plot</label>
        		<input type="text" name="m_plot" id="plot" class="form-control" placeholder="영화 줄거리" style="height:150px; width:300px">
       			<br>
       			
        		<button class="btn btn-lg btn-primary btn-block" type="submit" style="width:300px" > 추가하기  </button>
       </form>
	   </div> 
</body>
</html>