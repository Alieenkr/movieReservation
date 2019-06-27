<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<!-- Custom styles for this template -->
		<link rel="stylesheet" href="../css/theme.css"> 
		<!-- Bootstrap core CSS -->
		<link rel="stylesheet" href="../css/bootstrap.min.css">
		 <!-- Bootstrap theme -->
		<link rel="stylesheet" href="../css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	</head>
	
	<body>
		
<%
	String mem_id = null;
	if(session.getAttribute("mem_id") != null) {
	mem_id = (String) session.getAttribute("mem_id");
	}
%>

	<!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="../home.jsp"> 영화 예약 시스템 </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="../home.jsp"> 메인 </a></li>
            <li><a href="../reserve/reserve_main.jsp"> 영화예매 </a></li>
            <li><a href="../cinema/cinema_main.jsp"> 영화관 </a></li>
             <li><a href="movie_main.jsp"> 영화 </a></li>
             <li><a href="movierank.jsp"> 영화순위 </a></li>
             </ul>
             
<!-- 접속하기는 로그인 안한 사람만 보여줌. -->
<%
	if(mem_id == null){
%>
           <ul class="nav navbar-nav">  
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 접속하기 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="../login.jsp"> 회원 로그인 </a></li>
                <li><a href="../join.jsp"> 회원 가입 </a></li>
                <li><a href="../adminlogin.jsp"> 관리자 모드 </a></li>
                </ul>
             </li>
           </ul>
<%
	} else {
%>         
       <ul class="nav navbar-nav">  
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 접속하기 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="logoutAction.jsp">로그 아웃</a></li>
                <li class="divider"></li>
                <li class="dropdown-header"> MYPAGE </li>
                <li><a href="../reserve/myreserve"> 나의 티켓관리 </a></li>
                <li><a href="../meminfo.jsp"> 나의 회원정보  </a></li>
          
              </ul>
            </li>
          </ul>
        </div>
        
<% 
	}
%>
      </div>
    </nav>
		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
		
</body>
</html>