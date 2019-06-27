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
	String people=request.getParameter("people");
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 영화 예매 - 인원 선택 </title>
</head>
<body>
<form name="seating" method="post" action="reserveAction.jsp">
	<input name="mem_id" type="hidden" value="<%=session.getAttribute("mem_id")%>">
	<input name="m_title" type="hidden" value="<%=request.getParameter("m_title")%>">
	<input name="c_name" type="hidden" value="<%=request.getParameter("c_name")%>">
	<input name="showdate" type="hidden" value="<%=request.getParameter("showdate")%>">
	<input name="screenNO" type="hidden" value="<%=request.getParameter("screenNO")%>">
	<input name="showtime" type="hidden" value="<%=request.getParameter("showtime")%>">
	<input name="people" type="hidden" value="<%=request.getParameter("people")%>">
	<input name="reserDate" type="date" id="currentDate" style="display:none">
	<br>
	<br>
	선택하신 인원은<font color=red><%=request.getParameter("people")%></font>명 입니다.<br>
    <font color=red><%=request.getParameter("people")%></font>개의 좌석을 선택하세요.    
 
  
  	<table border="1" width="400">
  	    <tr> <td colspan="11" align=center>스크린</td> </tr>
    <tr align=center>
        <td width="30">&nbsp;</td>
        <td width="20">01</td>
        <td width="20">02</td>
        <td width="20">03</td>
        <td width="20">04</td>
        <td width="20">05</td>
        <td width="20">06</td>
        <td width="20">07</td>
        <td width="20">08</td>
        <td width="20">09</td>
   		<td width="20">10</td>
  </tr>
    <%for(char j='A'; j<='J'; j++) { %>
    	<tr align=center> 
    	<td width="30"><%=j%>열</td>
    	<td>
    	<%for(int i=1; i<=10; i++){%>
    		  
  			<input type="checkbox" id="seat<%=j%><%=i%>" name="Seat" value="<%=j%><%=i%>/" 
  			onclick="check_click(this,'<%=j%><%=i%>',this.value,'<%=j%><%=i%>')"
  		<%}%>  
 		></td>
 		 </tr>
 		
	<%}%>
  	</table>
	<input type="text" name="reSeat" value="좌석을 입력해주세요."><br>
 	<input type="submit" class="btn btn-success" id="sendContact" value="선택완료"/>
</form>

<script>
  document.getElementById("currentDate").value = new Date().toISOString().substring(0, 10);;
</script>

</body>
</html>