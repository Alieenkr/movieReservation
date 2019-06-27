<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@page import="msystem.DBConnection" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
   
<%@ page import="java.util.*" %>  

<%
	String m_title=request.getParameter("m_title");	
	String c_name=request.getParameter("c_name");	
	String showdate=request.getParameter("showdate");
	String screenNO=request.getParameter("screenNO");
	String showtime=request.getParameter("showtime");
	//session.setAttribute("mem_id", id);
	//session.setAttribute("mem_pwd", pwd);
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 인원 선택 </title>
</head>
<body>
<form name="rePeople" method="post" action="reserveSeat.jsp">
	<input name="mem_id" type="hidden" value="mem_id">
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>">
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	<input name="showdate" type="hidden" value="<%=request.getParameter("showdate")%>">
	<input name="screenNO" type="hidden" value="<%=request.getParameter("screenNO")%>">
	<input name="showtime" type="hidden" value="<%=request.getParameter("showtime")%>">
	<select name="people" size="5" style="width:250px">
		<option value="" style="font-size:30px">인원 선택</option>
 		<option value="1" style="font-size:30px">1</option>
     	<option value="2" style="font-size:30px">2</option>
     	<option value="3" style="font-size:30px">3</option>
     	<option value="4" style="font-size:30px">4</option>
 	</select>
 	<input type="submit" class="btn btn-success" id="sendContact" value="다음"/>
</form>
</body>
</html>