

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
 

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

		<title> Top </title>
	</head>
	
<body role="document">
<!-- �α����� ȸ���� ���� ����� ���̵� ������ mem_id�� ������ ����,
�ƴϸ� null ���� ���´�. -->

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
          <a class="navbar-brand" href="../home.jsp"> ��ȭ ���� �ý��� </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="../home.jsp"> ���� </a></li>
            <li><a href="reserve_main.jsp"> ��ȭ���� </a></li>
            <li><a href="../cinema/cinema_main.jsp"> ��ȭ�� </a></li>
             <li><a href="../movie/movie_main.jsp"> ��ȭ </a></li>
             <li><a href="../movie/movierank.jsp"> ��ȭ���� </a></li>
             </ul>
             
<!-- �����ϱ�� �α��� ���� ����� ������. -->
<%
	if(mem_id == null){
%>
           <ul class="nav navbar-nav">  
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> �����ϱ� <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="../login.jsp"> ȸ�� �α��� </a></li>
                <li><a href="../join.jsp"> ȸ�� ���� </a></li>
                <li><a href="../topAdmin.jsp"> ������ ��� </a></li>
                </ul>
             </li>
           </ul>
<%
	} else {
%>         
       <ul class="nav navbar-nav">  
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> �����ϱ� <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="../logoutAction.jsp">�α� �ƿ�</a></li>
                <li class="divider"></li>
                <li class="dropdown-header"> MYPAGE </li>
                <li><a href="myreserve"> ���� Ƽ�ϰ��� </a></li>
                <li><a href="../meminfo.jsp"> ���� ȸ������  </a></li>
          
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
        
<% 
	}
%>
      </div>
    </nav>
    
           
    <form name="startR" action="reserveTitle.jsp" method="post">
    <div class="jumbotron">
    <div class="container">
  <h1> ��ȭ ���� �ϱ� </h1>
  <p> �Ʒ� ��ư�� Ŭ���Ͽ� ��ȭ�� ���Ÿ� �����ϼ���. </p>
  <p><a class="btn btn-primary btn-lg" type="submit" href="reserveTitle.jsp" role="button"> �����Ϸ� ���� </a></p>
  </div>
</div>
</form>
      
	

 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
	
	
</body>
</html>