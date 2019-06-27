<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

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

		<title> TopAdmin </title>
	</head>
	
<body role="document">
<!-- 로그인한 회원의 세션 만들기 아이디가 있으면 mem_id에 정보가 담기고,
아니면 null 값을 갖는다. -->

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
          <a class="navbar-brand" href="topAdmin.jsp"> 영화 예약 시스템 </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="../admin/topAdmin.jsp"> 메인 </a></li>
            <li><a href="../admin/admin_member.jsp"> 회원관리 </a></li>
            <li><a href="../admin/admin_cinema.jsp"> 영화관관리 </a></li>
             <li><a href="../admin/admin_screen.jsp"> 상영관관리 </a></li>
             <li><a href="../admin/admin_showing.jsp"> 상영관리 </a></li>
             <li><a href="../admin/admin_movie.jsp"> 영화관리  </a></li>
             <li><a href="../admin/admin_ticket.jsp"> 티켓관리 </a></li>
             </ul>
             
<!-- 접속하기는 로그인 안한 사람만 보여줌. -->
<%
	if(mem_id == null){
%>
           <ul class="nav navbar-nav">  
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 접속하기 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="../login.jsp"> 관리자 로그인 </a></li>
                <li><a href="../topMember.jsp"> 회원 모드 </a></li>
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
                <li><a href="../logoutAction.jsp">로그 아웃</a></li>
          
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
        
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