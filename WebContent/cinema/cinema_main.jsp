<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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

		<title> 영화관 </title>
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
          <a class="navbar-brand" href="../home.jsp"> 영화 예약 시스템 </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="../home.jsp"> 메인 </a></li>
            <li><a href="../reserve/reserve_main.jsp"> 영화예매 </a></li>
            <li><a href="cinema_main.jsp"> 영화관 </a></li>
             <li><a href="../movie/movie_main.jsp"> 영화 </a></li>
             <li><a href="../movie/movierank.jsp"> 영화순위 </a></li>
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
                <li><a href="../logoutAction.jsp">로그 아웃</a></li>
                <li class="divider"></li>
                <li class="dropdown-header"> MYPAGE </li>
                <li><a href="../reserve/myreserve.jsp"> 나의 티켓관리 </a></li>
                <li><a href="../meminfo.jsp"> 나의 회원정보  </a></li>
          
              </ul>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
        
<% 
	}
%>
      </div>
    </nav>
    
   		 <div class="page-header">
 			<h1>&nbsp; 영화관  <small>&nbsp; 영화관 정보를 조회합니다. </small></h1>
		</div>
      
          <table class="table table-striped">
            <thead>
              <tr>
                <th>이름</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>상영관</th>
                <th>좌석 수</th>
              </tr>
            </thead>
        <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			con=DBConnection.getCon();
			String sql = "select *, sum(seatNum), count(screenNO) from cinema join screen on cinema.c_name=screen.c_name group by cinema.c_name";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String c_name = rs.getString("c_name");
				String c_addr = rs.getString("c_addr");
				String c_phone = rs.getString("c_phone");
				int c_tScreen = rs.getInt("count(screenNO)");
				int c_tSeat = rs.getInt("sum(seatNum)");
			%>				
            <tbody>
              <tr>
                <td><%=c_name%></td>
                <td><%=c_addr%></td>
                <td><%=c_phone%></td>
                <td><%=c_tScreen%></td>
                <td><%=c_tSeat%></td>
                </tr>
            </tbody>
            <% } 
            } 
		catch (SQLException se) {
            System.out.println(se.getMessage());
        } finally {
            try {
            	if(rs!=null) rs.close();
            	if(pstmt!=null) pstmt.close();
            	if(con!=null) con.close();
            } 
            catch(SQLException se) {
            	System.out.println(se.getMessage());
            }
       }%>
       </table>
  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script> 
	<script src="../js/docs.min.js"></script>
</body>
</html>